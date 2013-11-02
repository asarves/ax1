require File.dirname(__FILE__) + "/spec_helper"
require 'json'
require 'pp'

describe "Event" do

  def app
    AxAgenda
  end

  it "load initial data" do
    post '/initialLoad'
    puts last_response.body
    pp JSON.parse(last_response.body)
  end


  it "load repeated events" do
    post '/loadRepeatEvent'
    puts last_response.body
  end

  it "retrieve all users" do
    get '/users'
    last_response.should be_ok
  end


  it 'test create repeated event' do
    event_data = {"calendarId"=>"1", "startDay"=>"2013-03-26", "endDay"=>"2013-03-26", "startHMTime"=>"12:15", "endHMTime"=>"13:15", "repeatType"=>"{\"rtype\":\"week\",\"intervalSlot\":1,\"dspan\":0,\"beginDay\":\"2013-03-26\",\"endDay\":\"no\",\"rday\":{\"2\":true}}", "alertFlag"=>"null", "locked"=>"false", "subject"=>"lkfdjlkfdjlkj", "description"=>"lkfjdlkdjlk", "allday"=>"false", "usertodo"=>"1#je", "userdone"=>"", "finished"=>"", "userId"=>"1"}
    
    post '/createEvent', event_data
    last_response.should be_ok
  end
  # it 'delete files on event' do
  #   puts "Start delete file"
  #   data = '{"filename": "documents/358/channels.conf", "calendarId": 4}'
  #   post '/deleteUploadedFile', JSON.parse(data)
  #   last_response.should be_ok
  #   puts last_response.body
  #   json_response = JSON.parse(last_response.body)
  #   puts json_response['errorInfo']
  #   json_response['success'].should == true 
  #   puts "End delete file"
  # end

  it 'test mail' do
    post '/testMail', JSON.parse('{"to": "", "subject": "", "body": ""}')
    puts last_response.body
    last_response.should be_ok

    json_response = JSON.parse(last_response.body)

    puts json_response['errorInfo']
    json_response['success'].should == true 
  end

  # it "create alerts on events" do
  #   data = '{"id":895, "calendarId":1, "startDay":"2013-02-01", "endDay":"2013-02-01", "startHMTime":"10:00", "endHMTime":"11:00", "repeatType":{"rtype":"day","intervalSlot":2,"dspan":20,"beginDay":"2013-01-29","endDay":"2014-01-23"}, "alertFlag":[{"type":"email","early":30,"unit":"minute","emails":"dfd, fdfds"}], "locked":"false,subject","description": "the description" }'
  #   post '/updateEvent', JSON.parse(data)
  #   last_response.should be_ok
  #   json_response = JSON.parse(last_response.body)
  #   puts json_response['errorInfo']
  #   json_response['success'].should == true 
  # end
end

