# -*- coding: utf-8 -*-
0;271;0c# -*- coding: utf-8 -*-
require './mailers/event_mailer'

class WeeklyMailer

  attr_accessor :logger

  def initialize
    @logger = Logger.new("log/mailer.log")
    original_formatter = Logger::Formatter.new
    @logger.formatter = proc { |severity, datetime, progname, msg|
      original_formatter.call(severity, datetime, progname, msg)
    }
  end


  def get_weekly_events(class_name)
    klass = eval(class_name)
    if class_name == "EventJe"
      users = JeUser.where("login != 'Mathilde'").map { |u| u if not u == "" }.compact
    else
      users = JdUser.where("login != 'Mathilde'").map { |u| u if not u == "" }.compact
    end
    actions = {}
    current_time = DateTime.current
    end_week = current_time + 5.days
    conditions = "datep >= '" + current_time.to_s + "' and datep <= '" + end_week.to_s + "' and percent != 100"
    events = klass.where(conditions).order('datep')
    events.each { |e| 
      next if e.user_todo.nil? 
      next if e.event_type.code == 'AC_REGIE'
      if actions[e.user_todo].nil?
        actions[e.user_todo] = []
      end
      actions[e.user_todo].push(e)
    }
    # les users sans actions
    (Set.new(users) ^ Set.new(actions.keys)).each { |u|
      actions[u] = []
    }
    actions
  end

  def get_ids(actions)
    ids = ''
    actions.each_key { |user| 
      ids += "\n" + user.email + " : "
      actions[user].each { |event|
        ids += ", " + event.id.to_s
      }
    }
  end

  def build_send_mail(events, subject)

    actions_type = subject.sub('Actions ', '')

    events.each_key { |e|
      body = ''
      if events[e].size == 0
        body = "Bonjour #{e.login},\nAucune action de prévue cette semaine pour #{actions_type}.\n"
        body += "Bonne semaine"
        EventMailer.send_weekly(e, subject, body).deliver
        next
      end
      body += "Bonjour #{e.login},\n"
      body += "Liste des actions prévues cette semaine pour #{actions_type}:\n"
      events[e].each { |a|
        # next if a.societe.nil? and a.contact.nil?
        name = a.contact.nil? ? '' : a.contact.name
        firstname = a.contact.nil? ? '' : a.contact.firstname
        nom_societe = a.societe.nil? ? '' : a.societe.nom
        mobile_contact = a.contact.nil? ? '' : a.contact.phone_mobile
        tel_contact = a.contact.nil? ? '' : a.contact.phone

        body += "\nSociété : " + nom_societe
        if name.length != 0
          body += " / contact : " + firstname + " " + name + "\n"
        end
        body += "mobile : #{mobile_contact} / tel : #{tel_contact}\n"
        body += "Sujet : " + a.label.to_s + "\n"
        body += "Description : " + a.note.to_s + "\n\n"
        body += "========================\n\n"
      }
      body += "Bonne semaine"
      EventMailer.send_weekly(e, subject, body).deliver
    }
  end


  def actions_to_s(actions) 
    s = ''
    actions.each_key { |u|
      s += "#{u.email} <"
      actions[u].each { |a| s += a.id.to_s + "," }
      s += ">"
    }
    s
  end

  def run
    weekly_events_je = get_weekly_events("EventJe")
    weekly_events_jd = get_weekly_events("EventJd")

    build_send_mail(weekly_events_je, "Actions Jobenfance")
    build_send_mail(weekly_events_jd, "Actions Jobdependance")


    @logger.info "Nbr actions JE semaine #{weekly_events_je.size} ids <" + actions_to_s(weekly_events_je) + ">"
    @logger.info "Nbr actions JD semaine #{weekly_events_jd.size} ids <" + actions_to_s(weekly_events_jd) + ">"

  end
end

weekly_mailer = WeeklyMailer.new
weekly_mailer.run
weekly_mailer.logger.close

