class LinksController < ApplicationController

  def index
    if current_user
      @links = Link.all.where(user_id: current_user.id)
    end
    @link = Link.new
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id
    if @link.save
      flash[:success] = "Your link has been created"
      redirect_to root_path
    else
      flash[:alert] = "There was a problem. #{@link.errors.full_messages.join(' ')}. Please try again."
      render :new
    end
  end

  private

  def link_params
    params.require(:link).permit(:id, :url, :title, :user_id)
  end

end
