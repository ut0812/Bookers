class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.find_by(params[:id])

  end

  def create
    @book = Book.new(book_params)
    if @book.save
    redirect_to new_book_path(@book.id)
    flash[:notice] = "Book was successfully created."
    else
      @books = Book.all
      render :index
    end

  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    if book.destroy  # データ（レコード）を削除
    flash[:notice1] = "Book was successfully destroyed"
    end


    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to new_book_path(@book.id)
    flash[:notice2] = "Book was successfully updated."
    else
      @books = Book.all
      render :edit
    end

  end

   def book_params
    params.require(:book).permit(:title, :body)
  end

end
