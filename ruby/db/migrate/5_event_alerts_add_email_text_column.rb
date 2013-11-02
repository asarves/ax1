class EventAlertsAddEmailTextColumn < ActiveRecord::Migration
  def up
    add_column :event_alerts, :email_text, :text
  end

  def down
    remove_column :event_alerts, :event_class_name
  end
end
