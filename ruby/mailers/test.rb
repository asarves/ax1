# -*- coding: utf-8 -*-
require 'action_mailer'
require './models/cal_db'
require './models/calendar'
require './models/upload'


# -*- coding: utf-8 -*-
class TestEventMailer < ActionMailer::Base

  mailer_config = YAML.load_file(File.join(File.dirname(__FILE__), '../config/mailer.yml'))

  # @@logger = Logger.new(STDOUT)

  default :from => 'contact@jobenfance.com'

  ActionMailer::Base.smtp_settings = mailer_config['smtp_settings']

  def send_mytest(to, subject, body, eventId, calendarId)
    to      = to.nil? ? 'grego@mangue' : to
    subject = subject.nil? ? 'test subject' : subject
    body    = body.nil? ? 'test body' : body

    classname = ''
    self.logger.info("cal_id <#{calendarId}> id aje <#{Calendar::ACTIONS_JOBENFANCE}>")
    self.logger.info("aje <#{Calendar::ACTIONS_JOBENFANCE}> ajd <#{Calendar::ACTIONS_JOBDEPENDANCE}>")
    self.logger.info("rje <#{Calendar::REGIE_JOBENFANCE}> rjd <#{Calendar::REGIE_JOBDEPENDANCE}>")
    case calendarId.to_i
    when Calendar::ACTIONS_JOBENFANCE, Calendar::REGIE_JOBENFANCE
      classname = "EventJe"
    when Calendar::ACTIONS_JOBDEPENDANCE, Calendar::REGIE_JOBDEPENDANCE
      classname = "EventJd"
    end

    query   = "ev_id = #{eventId} and classname = '#{classname}'"
    uploads = Upload.where(query)
    self.logger.info("Query <#{query}>")
    self.logger.info("Nbr d'upload trouvés : #{uploads.size}")
    uploads.each { |upload|
      attachments[File.basename(upload.filepath)] = IO.binread(upload.filepath)
    }
    
    mail(:to => to.split(",\n"), :subject => subject) do |format|
      format.text { render :text => body }
    end
  end


end



# TestEventMailer.send_mytest("grego@mangue", "test suject", "test body").deliver

