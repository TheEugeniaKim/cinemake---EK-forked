class PostsController < ApplicationController
    def director_index
        @director = Director.find(params[:id])
    end

    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        if @post.valid?
            @post.save
            redirect_to post_path(@post)
        else 
            render :new
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    private
    def post_params
        params.require(:post).permit(:director_id, :movie_id, :title, :body)
    end
    
end
