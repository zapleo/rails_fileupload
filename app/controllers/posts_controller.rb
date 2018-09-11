class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    #raise params.inspect
    p params
    @post = Post.new(post_params)

    p post_params.inspect

    if @post.save
      flash[:success] = "Successfully created post"
    else
      flash[:danger] = @post.errors.full_messages
    end
    redirect_to root_path
  end

  private

  def post_params
    #Post::FILE_FIELDS
    params.require(:post).permit(:damage_overview_two)
  end
end
