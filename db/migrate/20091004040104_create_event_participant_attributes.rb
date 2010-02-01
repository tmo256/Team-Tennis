class CreateEventParticipantAtts < ActiveRecord::Migration
  def self.up
    create_table :event_participant_atts do |t|
      t.references :event_participant
      t.string :name
      t.string :value

      t.timestamps
    end
  end

  def self.down
    drop_table :event_participant_atts
  end
end
