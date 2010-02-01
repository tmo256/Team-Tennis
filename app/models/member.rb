class Member < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :teams
  has_and_belongs_to_many :events
  has_many :member_attributes
  has_many :event_participants

  accepts_nested_attributes_for :member_attributes

  validates_uniqueness_of :email
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,  :message => "Email address not valid." 

  def full_name
    f = self.first_name + " " + self.last_name
  end
end
