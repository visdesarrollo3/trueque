class ForumCategoriesController < ApplicationController
  load_and_authorize_resource
  def index
    @forum_categories = ForumCategory.all
  end

  def show
    @forum_category = ForumCategory.find(params[:id])
  end

  def new
    @forum_category = ForumCategory.new
  end

  def create
    @forum_category = ForumCategory.new(params[:forum_category])
    if @forum_category.save
      redirect_to @forum_category, :notice => "Successfully created forum category."
    else
      render :action => 'new'
    end
  end

  def edit
    @forum_category = ForumCategory.find(params[:id])
  end

  def update
    @forum_category = ForumCategory.find(params[:id])
    if @forum_category.update_attributes(params[:forum_category])
      redirect_to @forum_category, :notice  => "Successfully updated forum category."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @forum_category = ForumCategory.find(params[:id])
    @forum_category.destroy
    redirect_to forum_categories_url, :notice => "Successfully destroyed forum category."
  end
end
