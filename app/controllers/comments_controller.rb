class CommentsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_post, only: [:edit, :update, :destroy,:show,:new,:create]


  def index
  end

  def show
  end

  def new
  	@comment = Comment.new
  end

  def create
  	    @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        @comment.post_id = @post.id
        @comment.save

        redirect_to root_path, notice: 'Your comment was successfully posted!'
    end



  private

    def find_post
    	@post = Post.find(params[:post_id])
        
    end

    def comment_params
        params.require(:comment).permit(:title, :content)
    end

    def find_comment
        @comment = Comment.find(params[:id])
    end
end
