class CommentsController < ApplicationController
  
  def new
     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:post_id])
     @comment = Comment.new
     authorize @comment
  end

  def create
    @comment = current_user.comments.build(params.require(:comment).permit(:body))
    @post = Post.find(params[:post_id])
    @comment.post = @post
    @topic = @post.topic
    authorize @comment

    if @comment.save
      redirect_to [@topic, @post], notice: "Comment was saved successfully."
    else
      flash[:error] = "Error creating comment. Please try again."
      render :new
    end
  end
end
