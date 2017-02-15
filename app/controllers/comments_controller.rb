class CommentsController < ApplicationController
  respond_to :html, :js

  def create
    @comment = current_user.comments.build(params.require(:comment).permit(:body))
    @post = Post.find(params[:post_id])
    @comment.post = @post
    @topic = @post.topic
    authorize @comment

    if @comment.save
      redirect_to [@topic, @post], notice: "Comment was saved successfully."
    else

      flash[:error] = @comment.errors.messages || "Error creating comment. Please try again."
      render "posts/show"
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @topic = @post.topic
 
    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
    end

    respond_with(@comment) do |format|
      format.html { redirect_to [@post.topic, @post] }
    end
  end
end
