# -*- coding: utf-8 -*-
# usage : pry -r ./scripts/console.rb


require 'active_support/all'
require 'logger'
require './helpers/utils'
require 'active_record'

require './models/my_cal_db'

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
require './models/event_my_cal'

require './models/jd_user'
require './models/je_user'

require './models/je_societe'
require './models/jd_societe'

require './models/je_contact'
require './models/jd_contact'

require './models/upload'

# require './axagenda'
