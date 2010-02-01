class EventParticipant < ActiveRecord::Base
  belongs_to :event
  belongs_to :member
  has_many :event_participant_atts, :dependent => :destroy

  accepts_nested_attributes_for :event_participant_atts
end
