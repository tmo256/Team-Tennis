class CreateEventParticipants < ActiveRecord::Migration
  def self.up
    create_table :event_participants do |t|

      t.references :event
      t.references :member
      t.string :attribute
      t.timestamps
    end
  end

  def self.down
    drop_table :event_participants
  end
end
