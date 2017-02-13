class CommentsController < ApplicationController

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
      redirect_to [@topic, @post]
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
      redirect_to [@topic, @post]
    end
  end
end