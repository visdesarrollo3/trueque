class ForumThreadsController < ApplicationController
  load_and_authorize_resource
  def index
    @forum_threads = ForumThread.all
  end

  def show
    @forum_thread = ForumThread.find(params[:id])
  end

  def new
    @forum_thread = ForumThread.new
  end

  def create
    @forum_thread = ForumThread.new(params[:forum_thread])
    if @forum_thread.save
      redirect_to @forum_thread, :notice => "Successfully created forum thread."
    else
      render :action => 'new'
    end
  end

  def edit
    @forum_thread = ForumThread.find(params[:id])
  end

  def update
    @forum_thread = ForumThread.find(params[:id])
    if @forum_thread.update_attributes(params[:forum_thread])
      redirect_to @forum_thread, :notice  => "Successfully updated forum thread."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @forum_thread = ForumThread.find(params[:id])
    @forum_thread.destroy
    redirect_to forum_threads_url, :notice => "Successfully destroyed forum thread."
  end
end
