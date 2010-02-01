class CreateMemberAttributes < ActiveRecord::Migration
  def self.up
    create_table :member_attributes do |t|
      t.references :member
      t.string :name
      t.string :value

      t.timestamps
    end
  end

  def self.down
    drop_table :member_attributes
  end
end
