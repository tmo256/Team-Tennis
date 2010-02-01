class EventsController < ApplicationController
  # GET /events
  # GET /events.xml
  def index
    @events = Event.find_all_by_team_id(params[:team_id])
    @team = @events.first.team

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.xml
  def create
    @event = Event.new(params[:event])
    @event.team_id = params[:team_id]
    @event.completed = false

    respond_to do |format|
      if @event.save
        flash[:notice] = 'Event was successfully created.'
        format.html { redirect_to( team_events_path( Team.find( params[:team_id] ) ) ) }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        flash[:notice] = 'Event was successfully updated.'
        format.html { redirect_to( team_events_path( Team.find( @event.team_id ) ) ) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = Event.find(params[:id])
    team_id = @event.team_id
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(team_events_path( Team.find( team_id ) ) ) }
      format.xml  { head :ok }
    end
  end

  def schedule
    @event = Event.find( params[:id], :include => :event_participants )

    template = @event.event_participants.length < 1 ? 'schedule_new' : 'schedule_edit'

    scheduled_members = @event.event_participants.collect{ |x| x.member_id }
    @members = []
    if scheduled_members.length > 0
      @members = @event.members.find( :all, :conditions => [ "events_members.member_id NOT IN (#{scheduled_members.join(',')})"] )
    else
      @members = @event.members
    end
    unscheduled_members = @event.member_ids - scheduled_members
    @members.length.times{ @event.event_participants.build( :member_id => unscheduled_members.shift, :event_participant_atts => [ EventParticipantAtt.new( :name => 'court_no' ) ] ) }

    @event.event_participants = @event.event_participants.sort_by{ |ep| ep.member.full_name }
    @event.event_participants.each do |t|
      logger.debug t.member.full_name
    end

    respond_to do |format|
      format.html { render :template => 'events/'+template }
      format.xml  { head :ok }
    end
  end

  def create_schedule
    event = Event.find(params[:id])
    event.update_attributes(params[:event])

    respond_to do |format|
      if event.save
        flash[:notice] = 'Event schedule was successfully created.'
        format.html { redirect_to( team_events_path( Team.find( event.team_id ) ) ) }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { redirect_to( schedule_event_path(params[:id]) ) }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update_schedule
    event = Event.find(params[:id])
    event.update_attributes(params[:event])

    respond_to do |format|
      if event.save
        flash[:notice] = 'Schedule was successfully updated.'
        format.html { redirect_to( team_events_path( Team.find(event.team_id) ) ) }
      else
        flash[:error] = 'Error!'
        format.html { redirect_to( schedule_event_path(params[:id]) ) }
      end
    end

  end
end
