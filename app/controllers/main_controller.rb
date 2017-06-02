class MainController < ApplicationController
    before_action :authenticate_user!
    def index
        @posts = Post.all
    end
    
    def create_post
       post = Post.new
       #post.writer = current_user.name
       post.content = params[:content]
       post.save
       
       redirect_to '/'
    end
    
    def create_comment
        comment = Comment.new
        #comment.writer = current_user.name
        comment.content = params[:content]
        comment.post_id = params[:post_id]
        comment.save
        
        redirect_to '/'
    end
    
    def delete
    delete_post = Post.find(params[:post_id])
    delete_post.destroy
    
    redirect_to '/'
  end
  
  def edit
    @edit_post = Post.find(params[:post_id])
  end
  
  def update
     update_post = Post.find(params[:post_id])
    update_post.content = params[:content]
    update_post.save
    
    redirect_to '/'
  end
  
end
