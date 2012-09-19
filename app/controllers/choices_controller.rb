class ChoicesController < ApplicationController

  before_filter :authenticate_user!

  def create
    @choice = Choice.make_choice(permitted_params.choice)
    respond_to do |format|
      format.js { render layout: false }
    end
  end

end
