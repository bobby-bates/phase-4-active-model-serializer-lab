class AuthorsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    authors = Author.all
    # byebug
    # render json: authors
    # render json: authors, each_serializer: AuthorProfileSerializer
    render json: authors, include: ['profile', 'posts', 'posts.tags']
  end
  
  def show
    author = find_author
    # render json: author
    render json: author, include: ['profile', 'posts', 'posts.tags']
  end

  def profile
    author = find_author
    render json: author, serializer: AuthorProfileSerializer
  end

  private

  def find_author
    Author.find(params[:id])
  end

  def render_not_found_response
    render json: { error: "Author not found" }, status: :not_found
  end

end
