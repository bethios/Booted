class CollaboratorsController < ApplicationController
  before_action :require_sign_in
  before_action :authorize_user

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @user.User.where(email: params[:user])
    collaborator = @wiki.collaborators.build(user_id: @user.id)

    if collaborator.save
      flash[:notice] = "Collaborator #{:user} saved!"
    else
      flash.now[:alert] = "There was an error saving your collaborators, please try again."
    end

    redirect_to wiki
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])
    @wiki = @collaborator.wiki

    if collaborator.destroy
      flash[:notice] = "#{oldCollaborator} was removed successfully."
      redirect_to :back
    else
      flash.now[:alert] = "There was an error deleting the collaborators."
      render :show
    end
  end

  private

  def authorize_user
    wiki = Wiki.find(params[:id])
    unless current_user == wiki.user && current_user.role == 'premium' || current_user.role == 'admin'
      flash[:alert] = "You do not have permission to add or delete collaborators"
      redirect_to wiki_path
    end
  end

end
