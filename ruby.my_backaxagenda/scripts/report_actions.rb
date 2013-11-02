# -*- coding: utf-8 -*-
# Deplace les actions non terminées au jour suivant même heure.
require 'active_support/all'
require 'logger'
require './helpers/utils'
require 'active_record'

require './models/jd_db'
require './models/je_db'
require './models/cal_db'

require './models/calendar'
require './models/event_alert'

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

require './axagenda'



def report_actions(start_date)
  end_date   = start_date + 1.day + 23.hour + 59.minute + 59.second  

  file = 'log/report_actions.log'

  @logger       = Logger.new(file)
  @logger.level = Logger::INFO

  @logger.info("START SCRIPT")

  conditions = "datep >= '#{start_date}' and datep < '" + (start_date + 1.day).to_s + "'"
  conditions += " and (datep2 <= '" + (start_date + 1.day).to_s + "' or datep2 is null)"
  conditions += " and percent != 100"
  conditions += " and not label like 'Société%ajoutée dans Dolibarr%'"
  conditions += " and not label like 'Facture%dans Dolibarr%'"
  conditions += " and not label like 'Bon de commande%validée%'"


  # conditions += "datep2 <= '#{end_date}' and "
  # conditions += "(datep2 <= '#{end_date}' or datep2 is null) and "
  # conditions += "percent != 100"
  # conditions += " and datep < 
  # conditions += "percent not in (-1, 100)"

  @logger.info("CONDITIONS: #{conditions}")

  events_je = EventJe.where(conditions)
  events_jd = EventJd.where(conditions)

  je_ids = events_je.map { |e| e.id }
  jd_ids = events_jd.map { |e| e.id }

  @logger.info("JE Event found #{events_je.size} ids #{je_ids}")
  @logger.info("JD Event found #{events_jd.size} ids #{jd_ids}")


  events_je.each { |event| next if event.event_type.code == 'AC_REGIE'; mov_to_next_day(event) }
  events_jd.each { |event| next if event.event_type.code == 'AC_REGIE'; mov_to_next_day(event) }

  @logger.info("END SCRIPT")
end

# start_date = DateTime.new(Date.current.year, Date.current.month, (Date.current - 1.day).day)



# file = STDOUT

def mov_to_next_day(event)
  log = "Deplace #{event.id} LABEL #{event.label} DU P #{event.datep} //// P2 #{event.datep2} AU "
  datep = event.datep
  if event.datep == "00:00:00"
    event.datep = "00:00:01"
  end

  if event.datep2 == "00:00:00"
    event.datep2 = "23:59:59"
  end
  event.datep  = event.datep + 1.day

  if event.datep2.nil? 
    event.datep2 = nil
  else
    event.datep2 = event.datep2 + 1.day
  end
  log += "#{event.datep}/#{event.datep2}"
  @logger.info(log)
  event.save
end

if ARGV.size != 0
  year, month, day = ARGV[0].split('-').map { |e| e.to_i }
  puts "#{day} #{month} #{year}"
  start_date = DateTime.new(year, month, day).to_date
  while start_date <= DateTime.yesterday
    report_actions start_date
    start_date = start_date.next_day
  end
else
  start_date = DateTime.yesterday
  report_actions start_date
end


