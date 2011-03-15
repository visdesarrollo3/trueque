class CommentsController < ApplicationController
  load_and_authorize_resource
  def create
    @comment = current_user.created_comments.new(params[:comment])
    @comment.commentable = find_commentable
    if @comment.save
      flash[:notice] = "El comentario ha sido creado"
    else
      flash[:error] = "No se puede crear el comentario. Intenta nuevamente"
    end
    redirect_to @comment.commentable
  end
  
  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = "El comentario se ha eliminado"
    redirect_to @comment.commentable
  end
  
  
  private
  
  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
  
end
