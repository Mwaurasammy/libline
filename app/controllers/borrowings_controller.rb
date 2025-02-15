class BorrowingsController < ApplicationController
  before_action :authenticate_user!

  def create
    book = Book.find(params[:book_id])

    if book.available
      borrowing = borrowing.create(
        user: current_user,
        book: book,
        due_date: 2.weeks.from_now
      )
      book.update(available: false)
      redirect_to profile_path, notice: "You borrowed '#{book.title}'"
    else
      redirect_to books_path, alert: "Book is already borrowed."
  end

  def update
    borrowing = Borrowing.find(params[:id])
    borrowing.update(returned: true)
    borrowing.book.update(available: true)
    redirect_to profile_path, notice: "You returned '#{borrowing.book.title}'"
  end
end
