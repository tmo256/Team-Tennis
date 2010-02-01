class CreateTeamsMembers < ActiveRecord::Migration
  def self.up
    create_table :members_teams, :id => false, :force => true do |t|

      t.references :team
      t.references :member
      t.timestamps
    end
  end

  def self.down
    drop_table :members_teams
  end
end
