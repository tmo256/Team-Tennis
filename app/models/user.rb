class User < ActiveRecord::Base
  has_one :member
  has_many :teams, :through => :member

  accepts_nested_attributes_for :member

  validates_confirmation_of :password, :on => :create

  def self.find_with_team_id( _id )
    u = self.find :all, :include => :member, :joins => "INNER JOIN members \
        ON members.user_id = users.id \
        INNER JOIN members_teams ON members_teams.member_id = members.id
        AND members_teams.team_id = #{_id} "
    u
  end
end
