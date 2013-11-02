

class Utils
  
  @@mylogger = Logger.new(STDOUT)


  def self.is_mobile_device(user_agent)
    return true if /(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.match(user_agent) || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.match(user_agent[0..3])
    return false
  end

  def self.societe_url(societe)
    url = ""
    if not societe.nil?
      # url = "<a href='http://dolibarr-new.local:88/societe/soc.php?socid="+societe.rowid.to_s+"'>"+societe.nom+"</a>"
      url = societe.nom
    end
    url
  end

  def self.contact_url(contact)
    url = ""
    if not contact.nil?
      # url = "<a href='http://dolibarr-new.local:88/contact/fiche.php?id="+contact.rowid.to_s+"'>"+contact.firstname + " " + contact.name + "</a>"
      url = contact.firstname + " " + contact.name
    end
    url
  end

  def self.cal_to_class(cal_nbr)
    class_name = nil
    case cal_nbr.to_i
    when Calendar::REGIE_JOBDEPENDANCE, Calendar::ACTIONS_JOBDEPENDANCE
      @@mylogger.info("jobdependance event")
      class_name = "EventJd"
    when Calendar::REGIE_JOBENFANCE, Calendar::ACTIONS_JOBENFANCE
      @@mylogger.info("jobenfance event")
      class_name = "EventJe"
    else
      @@mylogger.info("Calendar type not found <#{id}>")
    end
    return eval(class_name) if not class_name.nil?
    nil
  end

  def self.end_hour(event)
    hour_s = ''
    begin
      hour = event.fulldayevent == 1 ? 24 : DateTime.parse(event.datep2.to_s).hour
      if(hour < 10)
        hour_s = '0'+hour.to_s
      else
        hour_s = hour.to_s
      end
    rescue ArgumentError
      hour_s = '00'
    end
    hour_s
  end

  def self.end_minute(event)
    minute_s = ''
    begin
      minute = event.fulldayevent == 1 ? 0 : DateTime.parse(event.datep2.to_s).minute
      if(minute < 10)
        minute_s = '0'+minute.to_s
      else
        minute_s = minute.to_s
      end
    rescue ArgumentError
      minute_s = '00'
    end
    minute_s
  end

  def self.end_day(event)
    day = event.fulldayevent == 1 ? Date.parse(event.datep.to_s).day : Date.parse(event.datep2.to_s).day
    day_s = ''
    if(day < 10)
      day_s = '0'+day.to_s
    else
      day_s = day.to_s
    end
    day_s
  end

  def self.end_month(event)
    month = event.fulldayevent == 1 ? Date.parse(event.datep.to_s).month : Date.parse(event.datep2.to_s).month     
    month_s = ''
    if(month < 10)
      month_s = '0'+month.to_s
    else
      month_s = month.to_s
    end
    month_s
  end

  def self.end_year(event)
    Date.parse(event.datep2.to_s).year
  end

  def self.start_hour(event)
    hour = event.fulldayevent == 1 ? 0 : DateTime.parse(event.datep.to_s).hour
    hour_s = ''
    if(hour < 10)
      hour_s = '0'+hour.to_s
    else
      hour_s = hour.to_s
    end
    hour_s
  end

  def self.start_minute(event)
    minute = event.fulldayevent == 1 ? 0 : DateTime.parse(event.datep.to_s).minute
    minute_s = ''
    if(minute < 10)
      minute_s = '0'+minute.to_s
    else
      minute_s = minute.to_s
    end
    minute_s
  end

  def self.start_day(event)
    day = Date.parse(event.datep.to_s).day
    day_s = ''
    if(day < 10)
      day_s = '0'+day.to_s
    else
      day_s = day.to_s
    end
    day_s
  end

  def self.start_month(event)
    month = Date.parse(event.datep.to_s).month
    month_s = ''
    if(month < 10)
      month_s = '0'+month.to_s
    else
      month_s = month.to_s
    end
    month_s
  end

  def self.start_year(event)
    Date.parse(event.datep.to_s).year
  end

  def self.start_date(event)
    begin
      Date.parse(event.datep.to_s)
    rescue ArgumentError
      ""
    end
  end

  def self.end_date(event)
    begin
      event.fulldayevent == 1 ? Date.parse(event.datep.to_s) : Date.parse(event.datep2.to_s)
    rescue ArgumentError
      ""
    end
  end

end
