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
end
