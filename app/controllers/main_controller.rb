class MainController < ApplicationController
    before_action :authenticate_user!
    def index
        @posts = Post.all
    end
    
    def create_post
       post = Post.new
       post.writer = current_user.name
       post.content = params[:content]
       post.save
       
       redirect_to '/'
    end
    
    def create_comment
        comment = Comment.new
        comment.writer = current_user.name
        comment.content = params[:content]
        comment.image = params[:image]
        comment.post_id = params[:post_id]
        comment.save
        
        redirect_to '/'
    end
end
