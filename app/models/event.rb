class Event < ActiveRecord::Base
  belongs_to :team
  has_many :event_attributes
  has_many :event_participants, :include => :member, :dependent => :destroy
  has_and_belongs_to_many :members

  accepts_nested_attributes_for :event_participants, :event_attributes
end
