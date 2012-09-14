class MembersController < ApplicationController

  before_filter :authenticate_user!
  
  def create

    raise "invalid access!" unless params[:user_id].to_i == current_user.id && Meeting.find(params[:meeting_id].to_i)

    @member = Member.where("meeting_id = ? and user_id = ?", params[:meeting_id], params[:user_id]).first

    if @member
      @member.status = true
      @member.save
    else
      @member = Member.create(:meeting_id => params[:meeting_id].to_i, :user_id => params[:user_id].to_i, :status => true )
    end

    redirect_to @member.meeting
  end

  def destroy    
    @member = Member.find(params[:id])

    raise "invalid access!" unless @member && @member.user_id == current_user.id

    if @member
      @member.status = false
      @member.save
    end      

    redirect_to @member.meeting
  end
end
