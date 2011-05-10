# encoding: UTF-8

class ForumThreadsController < ApplicationController
  before_filter :get_forum_category, :only => [:new, :create]
  load_and_authorize_resource
  def index
    @forum_threads = ForumThread.all
  end

  def show
    @forum_thread = ForumThread.find(params[:id])
  end

  def new
    @forum_thread = @category.forum_threads.new
  end

  def create
    @forum_thread = current_user.forum_threads.new(params[:forum_thread])
    @forum_thread.forum_category = @category
    if @forum_thread.save
      redirect_to @forum_thread, :notice => "El hilo de discusión ha sido creado."
    else
      render :action => 'new'
    end
  end

  def edit
    @forum_thread = ForumThread.find(params[:id])
    @category = @forum_thread.category
  end

  def update
    @forum_thread = ForumThread.find(params[:id])
    params[:forum_thread].delete(:forum_category_id)
    if @forum_thread.update_attributes(params[:forum_thread])
      redirect_to @forum_thread, :notice  => "El hilo de discusión ha sido editado."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @forum_thread = ForumThread.find(params[:id])
    @forum_thread.destroy
    redirect_to @forum_thread.forum_category, :notice => "El hilo de discusión ha sido eliminado."
  end
  
  private
  
  def get_forum_category
    @category = ForumCategory.find(params[:forum_category_id])
  end
end
