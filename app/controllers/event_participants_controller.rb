class EventParticipantsController < ApplicationController
  # GET /event_participants
  # GET /event_participants.xml
  before_filter :find_or_new_team
  def index
    @team = @teams[0]
    @events = @team.events
    #@event_participants = EventParticipant.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @event_participants }
    end
  end

  def edit_event
    @event = Event.find(params[:event_id])
  end

  # GET /event_participants/1
  # GET /event_participants/1.xml
  def show
    @event_participant = EventParticipant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event_participant }
    end
  end

  # GET /event_participants/new
  # GET /event_participants/new.xml
  def new
    @event_participant = EventParticipant.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event_participant }
    end
  end

  # GET /event_participants/1/edit
  def edit
    @event_participant = EventParticipant.find(params[:id])
  end

  # POST /event_participants
  # POST /event_participants.xml
  def create
    @event_participant = EventParticipant.new(params[:event_participant])

    respond_to do |format|
      if @event_participant.save
        flash[:notice] = 'EventParticipant was successfully created.'
        format.html { redirect_to(@event_participant) }
        format.xml  { render :xml => @event_participant, :status => :created, :location => @event_participant }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event_participant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /event_participants/1
  # PUT /event_participants/1.xml
  def update
    @event_participant = EventParticipant.find(params[:id])

    respond_to do |format|
      if @event_participant.update_attributes(params[:event_participant])
        flash[:notice] = 'EventParticipant was successfully updated.'
        format.html { redirect_to(@event_participant) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event_participant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /event_participants/1
  # DELETE /event_participants/1.xml
  def destroy
    @event_participant = EventParticipant.find(params[:id])
    @event_participant.destroy

    respond_to do |format|
      format.html { redirect_to(event_participants_url) }
      format.xml  { head :ok }
    end
  end

  protected

  def find_or_new_team
    @teams = params[:user_id] ? Member.find( User.find(params[:id], :include => :member).member_id ).teams : [ Team.find_or_initialize_by_id(params[:team_id]) ]
  end

end
