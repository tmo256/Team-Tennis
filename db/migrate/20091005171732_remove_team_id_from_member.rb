class RemoveTeamIdFromMember < ActiveRecord::Migration
  def self.up
    remove_column :members, :team_id
  end

  def self.down
    add_column :members, :team_id, :integer
  end
end
