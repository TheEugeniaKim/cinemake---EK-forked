class MoviesController < ApplicationController

    def index
        @movies = Movie.all
    end

    def show
        @movie = Movie.find(params[:id])
    end
    
    def new
        @movie = Movie.new
    end

    def create
        @movie = Movie.new(movie_params)
        if @movie.valid?
            @movie.save
            DirectorMovie.create(:director_id => session[:user]["id"], :movie_id => @movie.id)
            redirect_to movie_path(@movie)
        else
            render :new
        end
    end

    def director_index
        @director = Director.find(params[:id])
    end

    private
    def movie_params
        params.require(:movie).permit(:name, :release_year, :synopsis, :production_company, :language_id)
    end
end
