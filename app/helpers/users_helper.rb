module UsersHelper

def user_has_event?(event)
  if @user && !@user.id.nil? # no sense in testing new users that have no events
    @user.member.events.include?(event)
  else
    false
  end
end

def user_has_team?(team)
  if @user && !@user.id.nil? # no sense in testing new users that have no teams
    @user.member.teams.include?(team)
  else
    false
  end
end

end
