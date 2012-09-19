class PermittedParams < Struct.new(:params, :user)
  def member
    params.permit(:user_id, :meeting_id)
  end

  def role
    params.require(:role).permit(:name, :meeting_id, :assign_id)
  end

  def choice
    params.require(:choice).permit(:meeting_id, :member_id, :role_id, :want)
  end

  def meeting
    params.require(:meeting).permit(:title, :intro, :invitation_list, :started_at, :location)
  end
end
