class CollaboratorsController < ApplicationController
  before_action :authorize_user

  def new
    @collaborator = Collaborator.new
  end

  def create
    @wiki = Wiki.friendly.find(params[:wiki_id])
    @user = User.find_by_email(params[:user])

    @collaborator = @wiki.collaborators.new(user_id: @user.id, wiki_id: @wiki.id)

    if @collaborator.save
      flash[:notice] = "Collaborator #{:user} saved!"
    else
      flash.now[:alert] = "There was an error saving your collaborators, please try again."
    end

    redirect_to @wiki
  end

  def destroy
    @wiki = Wiki.friendly.find(params[:wiki_id])
    @user = User.where(email: params[:user])
    @collaborator = @user.collaborator.find(params[:id])

    if @collaborator.destroy
      flash[:notice] = "#{@user.email} was removed successfully."
      redirect_to :back
    else
      flash.now[:alert] = "There was an error deleting the collaborators."
      render :show
    end
  end

  private

  def authorize_user
    wiki = Wiki.friendly.find(params[:wiki_id])
    unless current_user == wiki.user && current_user.role == 'premium' || current_user.role == 'admin'
      flash[:alert] = "You do not have permission to add or delete collaborators"
      redirect_to wiki_path
    end
  end

end
