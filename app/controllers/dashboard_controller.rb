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

  def update
    respond_to do |format|
      if @user.update(dashboard_params)
        format.html { redirect_to dashboard_index_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def dashboard_params
    params.require(:user).permit(:name, :email, :role)
  end


end
