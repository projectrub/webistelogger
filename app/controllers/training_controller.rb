class TrainingController < ApplicationController
  before_action :authenticate_user!
  before_action :show, only: [:create]

  def show
    @user = get_current_logged_in_user
    @pumpups = @user.pumpups
  end

  def new
    @pumpup = Pumpup.new
  end

  def create
    @pumpup = @user.pumpups.create(pumpup_params)
    redirect_to training_path(@user)
  end

  private

  def get_current_logged_in_user
      user_id = current_user.id
      User.find_by(id: user_id)
  end

  def pumpup_params
    params.require(:pumpup).permit(:series, :rep, :date)
  end
end
