require 'paginate'

class TopicsController < ApplicationController

  include Paginate

  def index
    @topics = paginate(Topic.all, 10, params[:page])
    @num_of_pages = @topics.count/10 + 1 
    @curr_page = params[:page] || 1
    authorize @topics
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def show
    @topic = Topic.find(params[:id])
    @num_of_pages = @topic.posts.count/10 + 1
    @curr_page = params[:page] || 1
    @posts = paginate(@topic.posts, 10, params[:page])
    authorize @topic
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def create
    @topic = Topic.new(topic_params)
    authorize @topic
    if @topic.save
      redirect_to @topic, notice: "Topic was saved successfully."
    else
      flash[:error] = "Error creating topic. Please try again."
      render :new
    end
  end

  def update
    @topic = Topic.find(params[:id])
    authorize @topic
    if @topic.update_attributes(topic_params)
      redirect_to @topic
    else
      flash[:error] = "Error saving topic. Please try again"
      render :edit
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :description, :public)
  end

end
