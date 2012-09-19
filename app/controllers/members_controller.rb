class MembersController < ApplicationController

  before_filter :authenticate_user!

  def create
    raise "invalid access!" unless params[:user_id].to_i == current_user.id && Meeting.find(params[:meeting_id].to_i)
    @member = Member::signin(permitted_params.member)
    redirect_to @member.meeting
  end

  def destroy
    @member = Member.signoff(params[:id])
    raise "invalid access!" unless @member && @member.user_id == current_user.id
    redirect_to @member.meeting
  end
end
