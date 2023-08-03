class BookCommentsController < ApplicationController
  
  def create
    book = Book.find(params[:book_id])
    comment = BookComment.new(comment_params)
    comment.book_id = book.id
    comment.user_id = current_user.id
    comment.save
    redirect_back fallback_location: books_path
  end
  
  def destroy
    comment = BookComment.find_by(book_id: params[:id])
    #byebug
    if current_user.id == comment.user_id
      comment.destroy
      redirect_back fallback_location: books_path
    else
      render 'books/show'
    end
  end
  
  private
  
  def comment_params
    params.require(:book_comment).permit(:comment)
  end
  
end
