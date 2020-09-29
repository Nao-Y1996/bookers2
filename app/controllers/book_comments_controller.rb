class BookCommentsController < ApplicationController
	before_action :correct_user, only: [:destroy]
	def create
		#binding.pry
		@comment = BookComment.new(comment_params)
		if @comment.save
			redirect_to book_path(params[:book_id])
		else
			render "books/#{params[:book_id]}/show"
		end
	end

	def destroy
		comment = BookComment.find(params[:id])
		comment.destroy
		redirect_to request.referer
	end

	private
	def comment_params
		params.require(:book_comment).permit(:comment,:user_id,:book_id)
	end

	def correct_user
		# binding.pry
		comment = BookComment.find(params[:id])
		if comment.user != current_user
			redirect_to request.referer
		end
	end
end
