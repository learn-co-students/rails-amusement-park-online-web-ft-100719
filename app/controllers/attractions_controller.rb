class AttractionsController < ApplicationController
  
  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@post)
  end

  def show
    @attraction = Attraction.find_by_id(params[:id])
    #@ride = @attraction.ride.build
  end

  def edit
    @attraction = Attraction.find_by_id(params[:id])
  end

  def update
  end

  def destroy
  end

  
end
#################


def create
  #raise @post.inspect
  
  @post = Post.create(post_params)

  redirect_to post_path(@post)
end

private

def post_params
  params.require(:post).permit(:title, 
                               :content, 
                               category_ids:[], 
                               categories_attributes: [:name],
                               comments: [:content,
                                          :user_ids])
end