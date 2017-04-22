class WikisController < ApplicationController
  def index
    @user = current_user
    @wikis = Wiki.all
  end

  def show
    @user = current_user
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def create
    @wiki = Wiki.new
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.private = params[:wiki][:private]
    @wiki.user = current_user

    if @wiki.save
      flash[:notice] = "Wiki was saved!"
      redirect_to edit_wiki_path(@wiki)

    else
      flash.now[:alert] = "There was an error saving your wiki, please try again."
      render :new
    end
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.private = params[:wiki][:private]

    if @wiki.save
      flash[:notice] = "Wiki was updated"
      redirect_to :back
    else
      flash.now[:alert] = "There was an error saving your changes. Please try again."
      render :edit
    end
  end

  def destroy
    @user = current_user
    @wiki = Wiki.find(params[:id])

    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleting the wiki."
      render :show
    end

  end

end
