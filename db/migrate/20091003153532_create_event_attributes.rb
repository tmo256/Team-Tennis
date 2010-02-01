class CreateEventAttributes < ActiveRecord::Migration
  def self.up
    create_table :event_attributes do |t|
      t.references :event
      t.string :name
      t.string :value

      t.timestamps
    end
  end

  def self.down
    drop_table :event_attributes
  end
end
