class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]


  def index
  	@posts = Post.all.order("created_at DESC")
  end

  def new
  	@post = Post.new
  end

  def create
  	    @post = Post.new(post_params)
        @post.user_id = current_user.id

        if @post.save
            flash[:success] = "Post created successfully!"
            redirect_to root_path
        else
            render 'new'
        end
  end

  def edit
  end

  def show
  end

  def destroy
  	@post.destroy
  	redirect_to root_path
  end

  def update
  	    if @post.update(post_params)
            redirect_to post_path(@post)
        else
            render 'edit'
        end


  end

   private

    def post_params
        params.require(:post).permit(:title, :content)
    end

    def find_post
        @post = Post.find(params[:id])
    end
end
