class DashboardController < ApplicationController
  load_and_authorize_resource :user, :parent => false

  def index
    @users = User.all
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_index_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


end
