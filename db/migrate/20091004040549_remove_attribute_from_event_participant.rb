class RemoveAttributeFromEventParticipant < ActiveRecord::Migration
  def self.up
    remove_column :event_participants, :attribute
  end

  def self.down
    add_column :event_participants, :attribute, :string
  end
end
