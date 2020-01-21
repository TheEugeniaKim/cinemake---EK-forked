class DirectorsController < ApplicationController

    before_action :valid?, except: [:new, :create]

    def new
        if session[:user]
            redirect_to director_path(user)
        else
            @director = Director.new
        end
    end

    def create
        @director = Director.new(director_params)
        if @director.valid?
            @director.save
            session[:user] = @director
            redirect_to director_path(@director)
        else
            render :new
        end
    end

    def edit 
        
    end

    def show
        @director = Director.find(params[:id])
        @friend = Friend.new
    end

    def pending_friends
        @director = Director.find(params[:id])
    end
    
    private
        
    def director_params
        params.require(:director).permit(:name, :username, :password, :nationality, :email, :age, :image)
    end
end



