class MyCalendarEvent < MyCalDB
  include Event
  # attr_accessor :id # , :doliEventId
  # @cal_id = nil

  self.table_name = 'llx_axagenda_calendar_event'
  self.primary_key = 'id'
end










