class AddDescriptionToTeam < ActiveRecord::Migration
  def self.up
    add_column :teams, :description, :string, :null => true
  end

  def self.down
    remove_column :teams, :description
  end
end
