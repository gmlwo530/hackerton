class MainController < ApplicationController
    before_action :authenticate_user!
    def index
        @posts = Post.all.order('created_at DESC')
    end
    
    def create_post
       post = Post.new
       post.writer = current_user.name
       post.content = params[:content]
       post.option = params[:option]
       post.image = params[:image]
       post.save
       
       redirect_to '/'
    end
    
    def create_comment
        comment = Comment.new
        comment.writer = current_user.name
        comment.content = params[:content]
        comment.post_id = params[:post_id]
        comment.save
        
        redirect_to '/'
    end
    
    def ruby
        @post= post.find_by(value= "ruby")
    end

    def like
        like = Like.find_by(user_id: current_user.id,
                            post_id: params[:post_id])
        
        if like.nil?
            Like.create(user_id: current_user.id,
                        post_id: params[:post_id])
        else
            like.destroy
        end
        
        redirect_to :back
    end
    
    def comment_delete
        delete_comment = Comment.find(params[:comment_id])
        delete_comment.destroy
        
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
