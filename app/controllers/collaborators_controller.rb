class CollaboratorsController < ApplicationController
  before_action :set_wiki

  def new
    @collaborator = Collaborator.new
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = @wiki.collaborator.new(collaborator_params)
    @collaborator.user_id = User.find_by_email(params[:collaborators][:user]).id

    if @collaborator.save
      flash[:notice] = "Collaborators saved!"
      redirect_to :back
    else
      flash.now[:alert] = "There was an error saving your collaborators, please try again."
      render :new
    end
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])

    if @collaborator.destroy
      flash[:notice] = "\"#{@collaborator.user.email}\" was removed successfully."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleting the collaborators."
      render :show
    end
  end

  def index
    @collaborator = Collaborator.all
  end

  def show
    @collaborator = Collaborator.find(params[:id])
  end

  private

  def collaborator_params
    params.require(:collaborators).permit(:user)
  end
end
