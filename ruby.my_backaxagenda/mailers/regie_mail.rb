# -*- coding: utf-8 -*-

require File.join('.', File.dirname(__FILE__), 'event_mailer.rb')

@logger = Logger.new("log/mailer.log")
original_formatter = Logger::Formatter.new
@logger.formatter = proc { |severity, datetime, progname, msg|
  original_formatter.call(severity, datetime, progname, msg)
}


class RegieMailer

  attr_accessor :logger

  def initialize(logger)
    @logger = logger
  end

  def get_regie_events(class_name, day_nbr)
    klass = eval(class_name)
    actions = []

    current_time = DateTime.new(DateTime.current.year, DateTime.current.month, DateTime.current.day)
    date_start = current_time + day_nbr.days
    date_end = date_start + 24.hours
    conditions = "datep >= '"+ date_start.to_s + "' and datep < '" + date_end.to_s + "'"
    @logger.info("class name: <#{class_name}>")
    @logger.info("conditions <#{conditions}>")
    regie_type = klass.where("code = 'AC_REGIE'").first
    @logger.info("event type: <#{regie_type}>")
    events = regie_type.events.where(conditions)
    events.each { |event| 
      @logger.info("event id #{event.id}")
      alert = {}
      ev_alert = EventAlert.where("dol_ev_id = #{event.id}").first
      next if ev_alert.nil? or ev_alert.early != day_nbr
      emails = ev_alert.emails.split(',')
      files = []
      if class_name == 'EventTypeJe'
        Upload.where("ev_id = #{event.id} and classname = 'EventJe'").each { |up| 
          files.push(up.filepath)
        }
        alert['class_name'] = 'EventJe'
      else
        Upload.where("ev_id = #{event.id} and classname = 'EventJd'").each { |up| 
          files.push(up.filepath)
        }
        alert['class_name'] = 'EventJd'
      end
      alert['ev_id']       = event.id.to_s
      alert['emails']      = emails.map { |e| e.gsub(/\s/, '') }
      alert['files']        = files
      alert['label']       = event.label
      alert['text']        = ev_alert.email_text.nil? ? 'Message par défaut' : ev_alert.email_text
      alert['description'] = event.note
      actions.push(alert)
    }
    actions
  end


  def build_send_mail(events, subject)
    return if events.size == 0
    events.each { |event|
      dests = event['emails']
      body = event['text']
      # body  = "Bonjour,\n\n"
      # body += subject + ": \n"
      # body += event['label'] + "\n" + event['description']
      files =  event['files']
      @logger.info("files <#{files}>")
      @logger.info("dests #{dests}")
      dests.map! { |e| e.gsub(/\s/, '') }
      @logger.info("regies : <"+dests.to_s+">")
      EventMailer.send_regie_alert(dests, subject, body, files).deliver
    }
  end


  def get_ids(regies)
    ids = ''
    regies.each { |r| ids += ", " + r['ev_id'] }
    ids.sub(/^../, '')
  end

  def run
    re_je_3 = get_regie_events("EventTypeJe", 3)
    re_je_1 = get_regie_events("EventTypeJe", 1)

    re_jd_3 = get_regie_events("EventTypeJd", 3)
    re_jd_1 = get_regie_events("EventTypeJd", 1)


    @logger.info "Nbr RegieJe à 3 jrs  #{re_je_3.size} ids <" + get_ids(re_je_3) + ">"
    @logger.info "Nbr RegieJe à 1 jrs  #{re_je_1.size} ids <" + get_ids(re_je_1) + ">"

    @logger.info "Nbr RegieJd à 3 jrs  #{re_jd_3.size} ids <" + get_ids(re_jd_3) + ">"
    @logger.info "Nbr RegieJd à 1 jrs  #{re_jd_1.size} ids <" + get_ids(re_jd_1) + ">"

    build_send_mail(re_je_3, "Message auto: Bannières Jobenfance à 3 jours")
    build_send_mail(re_je_1, "Message auto: Bannières Jobenfance à 1 jours")

    build_send_mail(re_jd_3, "Message auto: Bannières Jobdependance à 3 jours")
    build_send_mail(re_jd_1, "Message auto: Bannières Jobdependance à 1 jours")
  end

end

@logger.info("==== START SCRIPT ====")

regie_mailer = RegieMailer.new(@logger)
regie_mailer.run
@logger.info("==== END SCRIPT ====")
@logger.close





