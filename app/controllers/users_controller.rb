class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
    commontator_thread_show(@user)
  end

  def edit
    render 'edit'
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    if @user.destroy
      redirect_to root_url, notice: "User deleted."
    end
  end


def vote
  value = params[:type] == "up" ? 1 : -1
  @user = User.find(params[:id])
  @user.add_or_update_evaluation(:votes, value, current_user)
  redirect_back(fallback_location: users_path)
end


end
