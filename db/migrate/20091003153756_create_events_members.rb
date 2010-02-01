class CreateEventsMembers < ActiveRecord::Migration
  def self.up
    create_table :events_members, :id => false, :force => true do |t|

      t.references :event, :null => false
      t.references :member, :null => false
    end
  end

  def self.down
    drop_table :events_members
  end
end
