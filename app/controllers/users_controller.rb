class UsersController < ApplicationController
  # GET /users
  # GET /users.xml

  before_filter :find_or_new_team

  def index
    @users = User.find_with_team_id( @team.id )
    @events = Event.find_all_by_team_id( @team.id )

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id], :include => :member)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new
    @user.member = Member.new
    @user.member.member_attributes = [ MemberAttribute.new ]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @teams = Team.all
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
    if @user.save
        flash[:notice] = 'Player was successfully created.'
        format.html { redirect_to( team_users_path( Team.find( params[:team_id] ) ) ) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])
    @member = Member.find(@user.member.id)

    respond_to do |format|
      if @user.update_attributes(params[:user]) && @member.update_attributes(params[:member])
        flash[:notice] = 'Profile was successfully updated.'
        format.html { render :action => "show" }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end

  def edit_event_availability
    @user = User.find(params[:id], :include => :member)
    @teams = @user.member.teams

    #@teams.each do |t|
      #t.events.each do |e|
        #e.event_participant_availabilities = [ EventParticipantAvailability.find_or_initialize_by_member_id_and_event_id( @user.member.id, e.id ) ]
      #end
    #end

    respond_to do |format|
      format.html { render :template => 'users/edit_events' }
      format.xml  { head :ok }
    end
  end

  def event_availability
    member = Member.find(params[:member][:id])

    respond_to do |format|
      if member.update_attributes(params[:member])
        flash[:notice] = 'Match dates were successfully updated.'
      else
        flash[:notice] = 'An error has occurred.'
      end
      format.html { redirect_to :action => 'edit_event_availability' }
      format.xml  { head :ok }
    end
  end

  protected
     
  def find_or_new_team
    @team = params[:team_id] ? Team.find(params[:team_id]) : Team.new()
  end

end
