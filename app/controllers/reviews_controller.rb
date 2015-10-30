class ReviewsController < ApplicationController
  before_filter :set_current_user
  before_filter :has_user_and_movie, :only => [:new, :create]
  def review_params
    params.require(:review).permit(:potatoes, :movie_id, :user_id)
  end
  protected
  def has_user_and_movie
    unless @current_user
      flash[:warning] = 'You must be logged in to create a review.'
      redirect_to login_path
    end
    unless (@movie = Movie.find_by_id(params[:movie_id]))
      flash[:warning] = 'Review must be for an existing movie.'
      redirect_to movies_path
    end
  end
  public

  def new
    #just renders views/reviews/new.html.haml template
  end

  def create
    # since user_id is a protected attribute that won't get
    # assigned by the mass-assignment from params[:review], we set it
    # by using the << method on the association.  We could also
    # set it manually with review.moviegoer = @current_user.
    @current_user.reviews << @movie.reviews.build(review_params)
    redirect_to movie_path(@movie)
  end
end
