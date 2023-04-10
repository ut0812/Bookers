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
    @book = Book.find(params[:id])

  end

  def create
    @book = Book.new(book_params)
    if @book.save
    redirect_to new_book_path(@book.id)
    flash[:notice] = "successfully"
    else
      @books = Book.all
      render :index
    end

  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    if book.destroy  # データ（レコード）を削除
    flash[:notice1] = "successfully destroyed"
    end


    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to new_book_path(@book.id)
    flash[:notice] = "successfully"
    else
      @books = Book.all
      render :edit
    end

  end

   def book_params
    params.require(:book).permit(:title, :body)
  end

end
