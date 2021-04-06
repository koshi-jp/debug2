class FindersController < ApplicationController
  def finder

    @range = params[:range]
    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    elsif @range == "Book"
      @books = Book.looks(params[:search], params[:word])
    end

  end
end
