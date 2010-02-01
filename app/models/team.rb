class Team < ActiveRecord::Base
  has_many :team_members
  has_and_belongs_to_many :members
  has_many :events, :dependent => :destroy
  has_many :event_participants, :through => :events

  accepts_nested_attributes_for :events
end
