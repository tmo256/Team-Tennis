class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.references :team
      t.string :title, :null => false
      t.string :location
      t.datetime :scheduled_date, :null => false
      t.datetime :actual_date
      t.text :notes
      t.boolean :completed

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
