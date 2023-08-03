class BookCommentsController < ApplicationController
  
  def create
    @book = Book.find(params[:book_id])
    @comment = BookComment.new(comment_params)
    @comment.book_id = @book.id
    @comment.user_id = current_user.id
    @comment.save
    @comments = BookComment.all
  end
  
  def destroy
    @comment = BookComment.find_by(params[:book_id])
    #byebug
    if current_user.id == @comment.user_id
      @comment.destroy
      @comments = BookComment.all
    else
      render 'books/show'
    end
  end
  
  private
  
  def comment_params
    params.require(:book_comment).permit(:comment)
  end
  
end
