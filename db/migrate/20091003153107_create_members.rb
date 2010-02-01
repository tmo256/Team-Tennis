class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.references :team
      t.references :user
      t.string :first_name
      t.string :last_name
      t.string :email, :null => false
      t.string :phone_number1
      t.string :phone_number2

      t.timestamps
    end
  end

  def self.down
    drop_table :members
  end
end
