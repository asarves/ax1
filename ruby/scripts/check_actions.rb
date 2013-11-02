# -*- coding: utf-8 -*-


require './scripts/console'
require 'pry'


# binding.pry

def check_events(start_date, end_date, limit, klass)

  while start_date < limit

    conditions = "datep >= '#{start_date}' and datep <= '" + end_date.to_s + "'"
    conditions += " and (datep2 <= '" + end_date.to_s + "' or datep2 is null)"
    conditions += " and percent = 100"
    conditions += " and not label like 'Société%ajoutée dans Dolibarr%'"
    conditions += " and not label like 'Facture%dans Dolibarr%'"
    conditions += " and not label like 'Bon de commande%validée%'"


    # puts conditions

    events = klass.where(conditions)

    puts "\t\tActions pour le #{start_date.day}/#{start_date.month}/13 (#{events.size} au total)\n"
    events.each { |event|
      nom = event.societe.nil? ? '' : event.societe.nom
      puts "\t\t\t- #{event.label}\t#{nom}"
    }
    start_date = end_date
    end_date = end_date + 1.day
  end
end


year, month, day = '2013-09-14'.split('-').map { |e| e.to_i }


start_date = DateTime.new(year, month, day).to_date
limit      = start_date + 11.day
end_date   = start_date + 1.day

puts "ACTIONS JOBENFANCE ET JOBDEPENDANCE TERMINÉES ENTRE LE 14/09/13 ET LE 25/09/13\n\n"

[EventJe, EventJd].each { |klass|  }

puts "\tActions JOBENFANCE\n\n"
check_events(start_date, end_date, limit, EventJe)
puts "\n\tActions JOBDEPENDANCE\n\n"
check_events(start_date, end_date, limit, EventJd)










