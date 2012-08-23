class MeetingsController < ApplicationController

before_filter :authenticate_user!, :except => [:index] 


  # GET /meetings
  # GET /meetings.json

  def index
    type = params.fetch(:type, 'all')
    case type
    when 'all'
      @meetings = Meeting.page(params[:page])
    when 'mine' 
      @meetings = current_user.mymeetings.page(params[:page])
    when 'join'
      @meetings = current_user.meetings.page(params[:page])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @meetings }
    end
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
    @meeting = Meeting.find(params[:id])
    @member = @meeting.members.find_by_user_id(current_user.id)
    @presenter = MeetingsHelper::EditPresenter.new(@meeting)

    member = params[:member]

    case member
    when 'join'
      if @member
        @member.status = true;
        @member.save
      else
        @member = Meeting.create(meeting_id:@meeting.id, user_id:@user.id)
      end

    when 'exit'
      if @member
        @member.status = false;
        @member.save
      end
    end

   
    if member
      redirect_to @meeting 
    else
      respond_to do |format|
        format.html # show.html.erb
      end
    end
  end

  # GET /meetings/new
  # GET /meetings/new.json
  def new
    @meeting = Meeting.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @meeting }
    end
  end

  # GET /meetings/1/edit
  def edit
    @meeting = Meeting.find(params[:id])
    @presenter = MeetingsHelper::EditPresenter.new(@meeting)

  end

  # POST /meetings
  # POST /meetings.json
  def create
    @meeting = Meeting.new(params[:meeting])
    @meeting.manager_id = current_user.id 
    respond_to do |format|
      if @meeting.save
        # create meeting: add roles, add members and send email to invite members
        #meeting_create(meeting)
        format.html { redirect_to @meeting, notice: 'Meeting was successfully created.' }
        format.json { render json: @meeting, status: :created, location: @meeting }
      else
        format.html { render action: "new" }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /meetings/1
  # PUT /meetings/1.json
  def update
    @meeting = Meeting.find(params[:id])

    respond_to do |format|
      if @meeting.update_attributes(params[:meeting])
        format.html { redirect_to @meeting, notice: 'Meeting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy

    respond_to do |format|
      format.html { redirect_to meetings_url }
      format.json { head :no_content }
    end
  end
end
