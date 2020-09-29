class BooksController < ApplicationController
	before_action :authenticate_user!, only: [:show,:edit,:index]
	before_action :correct_user, only: [:edit, :update]
    def index
    	@books = Book.all
    	@book = Book.new
    	#@book = Book.find(params[:id])
    end

    def show
    	@book = Book.find(params[:id])
        @book_comment = BookComment.new

    end

    def create
        #Binding.pry
    	@books = Book.all
    	@book = Book.new(book_params)
    	@book.user_id = current_user.id
    	if @book.save
    		flash[:notice] = "You have creatad book successfully."
    		redirect_to book_path(@book.id)
    	else
    		render :index
    	end
    end

    def edit
    	@book = Book.find(params[:id])
        #binding.pry

    end

    def update
    	@book = Book.find(params[:id])
    	if @book.update(book_params)
    		flash[:notice] = "You have updated book successfully."
   			redirect_to book_path(@book.id)
   		else
			render :edit
		end
    end

    def destroy
    	@book = Book.find(params[:id])
    	@book.destroy
    	redirect_to books_path
    end

    private#--------------------------------------------------
	    def book_params
	        params.require(:book).permit(:title, :body)
	    end

	    def correct_user
		    book = Book.find(params[:id])
		    if current_user != book.user
		      redirect_to books_path
		    end
		end
end
