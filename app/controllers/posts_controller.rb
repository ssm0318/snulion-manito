class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def new
    end

    def create
        title = params[:title]
        content = params[:content]
        Post.create(title: title, content: content)

        redirect_to action: 'index'
    end

    def destroy
        post_id = params[:id]
        Post.destroy(post_id)

        redirect_to action: 'index'
    end
    
    def create_comment
        post_id = params[:id]
        content = params[:content]

        post = Post.find(post_id)
        Comment.create(content: content, post_id: post_id)

        redirect_to action: 'index'
    end

    def destroy_comment
        comment_id = params[:comment_id]
        Comment.destroy(comment_id)

        redirect_to action: 'index'
    end

    def create_reply
        Reply.create(comment_id: params[:id], content: params[:content])
    end
end
