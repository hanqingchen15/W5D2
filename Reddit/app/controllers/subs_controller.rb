class SubsController < ApplicationController
  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def show
    @sub = Sub.find_by(id: params[:id])
  end

  def update
    @sub = current_user.mod_subs.find(params[:id])
    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def edit
    @sub = current_user.mod_subs.find(params[:id])
  end

  def index
    @subs = Sub.all
  end

  def destroy
    @sub = current_user.mod_subs.find(params[:id])
    @sub.destroy
    redirect_to subs_url
  end
  
  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
