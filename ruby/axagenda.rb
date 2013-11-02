# -*- coding: utf-8 -*-
require 'sinatra'

require 'sinatra/activerecord'
require 'haml'
require 'json'
# require 'logger'

require './helpers/utils'
require 'active_record'

require './mailers/test'

require './models/jd_db'
require './models/je_db'
require './models/cal_db'

require './models/event_alert'
require './models/repeat'

require './models/cal_db'
require './models/calendar'

require './models/event_type'
require './models/event_type_je'
require './models/event_type_jd'

require './models/event'
require './models/event_je'
require './models/event_jd'

require './models/jd_user'
require './models/je_user'

require './models/je_societe'
require './models/jd_societe'

require './models/je_contact'
require './models/jd_contact'

require './models/upload'

# require './controllers/events'


class AxAgenda < Sinatra::Base


  after do
    CalDB.connection.close
    JdDB.connection.close
    JeDB.connection.close
  end

  # enable :logging

  # mylogger = Logger.new(STDOUT)

  # logger = ENV['rack.logger']
  set :username,'axagenda'
  set :password,'axagenda'
  set :token,'osh@kerp@$@l@cuill3re'


  @@logger          = Logger.new('log/axagenda.log')
  @@logger.level    = Logger::INFO
  @@logger.progname = "AxAgenda"

  JdDB.logger  = @@logger
  JeDB.logger  = @@logger
  EventJe.logger = @@logger
  EventJd.logger = @@logger
  EventTypeJe.logger = @@logger
  EventTypeJd.logger = @@logger
  TestEventMailer.logger = @@logger
  
  # @@logger.level    = Logger::DEBUG
  Calendar.logger = @@logger

  helpers do
    def admin? ; request.cookies[settings.username] == settings.token ; end
    def protected! ; redirect url '/login' unless admin? ; end
  end




  get '/' do
    # protected!
    @@logger.info("User-Agent <#{env['HTTP_USER_AGENT']}>")
    if(Utils.is_mobile_device(env['HTTP_USER_AGENT']))
      @@logger.info("Mobile device detected")
      haml :index_mobile, :layout => :mobile_layout
    else
      @@logger.info("Not mobile device")
      haml :index
    end
  end

  
  post '/testMail' do 
    @@logger.info("test mail <#{params}>")
   @@logger.info("Runnning test email")
    # res = `ruby mailers/test.rb `
    # @@logger.info("res data #{$?}")
    # @@logger.info("res test mail #{res}")
    
    begin
      TestEventMailer.send_mytest(params['to'], params['subject'], 
                                  params['body'], params['eventId'],
                                  params['calendarId']).deliver
    rescue Exception => e
      data = {"success" => false, "errorInfo" => e.message }
    else
      data = {"success" => true }
    end
    @@logger.info("sent test status #{data}")
    haml data.to_json, :layout => false
  end

  post '/login' do
    if params['username'] == settings.username && params['password'] == settings.password
      response.set_cookie(settings.username,settings.token) 
      redirect '/'
    else
      redirect url '/login'
    end
  end

  get '/login' do
    haml :admin, :layout => :admin_layout
  end

  get '/initMobileApp' do
    send_file 'public/mobile/app.json'
  end

  get '/mobileEventData' do
    @@logger.info("Call from a mobile device")
    startDay = Date.current - 7.days
    endDay = Date.current + 7.days
    params['startDay'] = params['startDay'].nil? ? startDay.to_s : params['startDay']
    params['endDay'] = params['endDay'].nil? ? endDay.to_s : params['endDay']

    events = Calendar.get_events(params)

    my_events = events.map { |e| e.to_mobile_device }
    # my_events.sort! { |a,b| Date.parse(a['ymd']) <=> Date.parse(b['ymd']) }
    @@logger.info("total des events: #{my_events.size}");
    data = {'total' =>  my_events.size, 'rows' => my_events, 'success' => true }
    haml data.to_json, :layout => false
    # send_file 'public/mobile/data/eventData.json'
  end

  post '/initialLoad' do
    @@logger.info("initialLoad post")
    begin
      json_data = JSON.parse(File.read('public/init_load.json'))
      events = Calendar.get_repeat_events
      my_events = events.map { |e| e.to_mycalendar }
      my_events.sort! { |a,b| Date.parse(a['ymd']) <=> Date.parse(b['ymd']) }
      @@logger.info("total des repeated events: #{my_events.size}");
      json_data['re'] = my_events
    rescue Exception => e
      error_msg = e.message + "\n" + e.backtrace.join("\n")
      @@logger.error(error_msg)
    end
    haml json_data.to_json, :layout => false
    # send_file 'public/init_load.json'
  end


  post '/deleteEvent' do
    @@logger.info("Delete event #{params.to_s}")
    begin
      Calendar.delete_event(params)
    rescue Exception => e
      error_msg = e.backtrace.join("\n")
      @@logger.error(error_msg)
      data = { 'success' => false, 'errorInfo' => error_msg }
    else
      data = { 'success' => true }
    end
    haml data.to_json, :layout => false
  end

  get '/loadEvent' do
    post 'localhost/axagenda/loadEvent'
  end

  post '/createUpdateRepeatEvent' do
    @@logger.info("into createUpdateRepeatEvent params #{params}")
    begin
      Calendar.update_repeat(params)
    rescue Exception => e
      error_msg = e.backtrace.join("\n")
      @@logger.error(error_msg)
      data = { 'success' => false, 'errorInfo' => error_msg }
    else
      data = { 'success' => true }
    end
    haml data.to_json, :layout => false
  end

  get '/search' do
    @@logger.info("Into search #{params}");
    text = params['text']
    events_je = EventJe.order("datep desc").where("note like '%#{text}%' or label like '%#{text}%'")
    events_jd = EventJd.order("datep desc").where("note like '%#{text}%' or label like '%#{text}%'")
    events = events_je + events_jd
    my_events = events.map { |e| e.to_mycalendar }
    @@logger.info("total des repeated events: #{my_events.size}");
    data = {'total' =>  my_events.size, 'results' => my_events, 'success' => true }
    haml data.to_json, :layout => false
  end

  post '/loadRepeatEvent' do 
    @@logger.info("into loadRepeatEvent parms #{params.to_s}")
    events = Calendar.get_repeat_events(params)
    my_events = events.map { |e| e.to_mycalendar }
    my_events.sort! { |a,b| Date.parse(a['ymd']) <=> Date.parse(b['ymd']) }
    @@logger.info("total des repeated events: #{my_events.size}");
    data = {'total' =>  my_events.size, 'results' => my_events, 'success' => true }
    haml data.to_json, :layout => false
  end

  post '/loadEvent' do
    Calendar.set_all_visible
    params['usertodoValues'] = params['usertodoValues'] == 'undefined' ? '' : params['usertodoValues']
    @@logger.info("loadEvent params :#{params.to_s}")
    if(not params['usertodoValues'].nil? and params['usertodoValues'] != '' and params['usertodoValues'] != 'undefined') 
      events = Calendar.get_events_by_user(params)
    else
      events = Calendar.get_events(params)
    end
    # events = EventsController.find_by_month(DateTime.current)
    # mylogger.debug("total events #{events.size}")
    my_events = events.map { |e| e.to_mycalendar }
    my_events.sort! { |a,b| Date.parse(a['ymd']) <=> Date.parse(b['ymd']) }
    @@logger.info("total des events: #{my_events.size}")
    @@logger.debug(my_events)
    data = {'total' =>  my_events.size, 'results' => my_events, 'success' => true }
    haml data.to_json, :layout => false
  end

  get '/users' do
    @@logger.info("get users")
    all_users = Calendar.get_all_users
    data = { 'success' => true, 'users' => all_users }
    haml data.to_json, :layout => false
  end

  # params : user_id : id#[je|jd]
  #          combo_name: [userasked|usertodo|userdone]
  post '/showOnlyUserEvent' do
    @@logger.info("showOnlyUserEvent #{params.to_s}")

    events = Calendar.get_events_by_user(params)
    my_events = events.map { |e| e.to_mycalendar }
    # mylogger.debug("showOnlyUserEvent: size <#{my_events.size}>")
    data = {'total' =>  my_events.size, 'results' => my_events, 'success' => true }
    @@logger.info("showOnlyUserEvent: events:"+JSON.pretty_generate(data))
    haml data.to_json, :layout => false
  end

  post '/createEvent' do
    @@logger.info("Create Event #{params.to_s}")
    begin
      event = Calendar.createEvent(params)
    rescue Exception => e
      error_msg = e.backtrace.join("\n")
      @@logger.error(error_msg)
      data = { 'success' => false, 'errorInfo' => error_msg }
    else
      data = { 'success' => true, 'eventId' => event.id  }
    end
    haml data.to_json, :layout => false
  end

  post '/createUpdateCalendar' do
    events = Calendar.create_update_calendar(params)
    my_events = events.map { |e| e.to_mycalendar }
    data = {'total' =>  my_events.size, 'results' => my_events, 'success' => true }
    haml data.to_json, :layout => false
  end

  post '/updateEvent' do
    @@logger.info("updateEvent: " + params.to_s)
    begin
      Calendar.update_event(params)
    rescue Exception => e
      @@logger.error("Update error : " + e.message + "\n" + e.backtrace.join("\n"))
      data = { 'success' => false, 'errorInfo' => "Oups! (appel le dev!) : " + e.message }
    else
      @@logger.info("Update ok")
      data = { 'success' => true }
    end
    haml data.to_json, :layout => false
  end

  post '/showOnlyCalendar' do
    # events = Calendar.show_only_calendar(params)
    # my_events = events.map { |e| e.to_mycalendar }
    # data = {'total' =>  my_events.size, 'results' => my_events, 'success' => true }
    data = {'total' =>  0, 'results' => [], 'success' => true }
    haml data.to_json, :layout => false
  end

  
# {"phantom"=>"true", "internalId"=>"ext-record-187", "raw"=>"documents/358/bookmarks.html", "data"=>"documents/358/bookmarks.html", "dirty"=>"false", "id"=>"UploadedFile-ext-record-187", "store"=>""}
  post '/deleteUploadedFile' do
    @@logger.info("into deleteUploadedFile " + params.to_s)
    filename, calendarId = params.values
    begin
      @@logger.info("START DELETING THE FILE")
      Calendar.deleteFile(filename, calendarId)
    rescue Exception => e
      error_msg = "Filename <#{filename}> " + e.backtrace.join("\n")
      @@logger.error("Oups! " + error_msg)
      data = { 'success' => false, 'errorInfo' => "Oups! Problème : " + error_msg }
    else
      data = { 'success' => true, 'filename' => filename }
    end
    @@logger.info("returned value : #{data.to_s}")
    haml data.to_json, :layout => false
  end
# {"filename"=>{:filename=>"bookmarks.html", :type=>"text/html", :name=>"filename", :tempfile=>#<File:/tmp/RackMultipart20130316-13427-1g7m1kf>, :head=>"Content-Disposition: form-data; name=\"filename\"; filename=\"bookmarks.html\"\r\nContent-Type: text/html\r\n"}}
  post '/fileUpload' do
    @@logger.info("into fileUpload " + params.to_s)
    filename = ""
    begin
      filename = Calendar.store_file(params['event_id'], 
                                     params['cal_id'],
                                     params['filename'][:tempfile], 
                                     params['filename'][:filename])
    rescue Exception => e
      error_msg = "Filename <#{params['filename'][:filename]}>" + e.backtrace.join("\n")
      @@logger.error("Oups! " + error_msg)
      data = { 'success' => false, 'errorInfo' => "Oups! Problème : " + error_msg }
    else
      data = { 'success' => true, 'filename' => filename }
    end
    @@logger.info("returned value : #{data.to_s}")
    haml data.to_json, :layout => false
  end

end


