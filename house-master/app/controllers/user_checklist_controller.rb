class UserChecklistController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def update_checklist
    current_user.checklist.each do |todo, completed|
      current_user.checklist[todo] = params[:user][:checklist][todo] == "1"
    end
    current_user.save
    flash[:notice] = "Checklist was saved."
    redirect_to new_user_checklist_path
  end
end
