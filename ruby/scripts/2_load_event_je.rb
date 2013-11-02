# -*- coding: utf-8 -*-
require './scripts/console'
require 'pry'

# mycal_events = EventJe.all.map { |e| e.to_mycalendar_db  }
# mycal_events = EventJe.where(:datep => '2013-10-18 00:00:00').map { |e| e.to_mycalendar_db  }
# conditions = "datep >= '2013-10-18 00:00:00' and datep2 is not null and datep2 <= '2013-10-18 24:00:00'"
conditions = " percent != 100"
# conditions += " and percent != 100"
conditions += " and not label like 'Société%ajoutée dans Dolibarr%'"
conditions += " and not label like 'Facture%dans Dolibarr%'"
conditions += " and not label like 'Bon de commande%validée%'"

puts conditions

mycal_events = EventJe.where(conditions)

pry.binding


