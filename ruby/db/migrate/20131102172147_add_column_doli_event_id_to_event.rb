class AddColumnDoliEventIdToEvent < ActiveRecord::Migration
  def up

    add_column :llx_axagenda_calendar_event, :doli_event_id, :integer
  end

  def down
    remove_column :llx_axagenda_calendar_event, :doli_event_id
  end
end
