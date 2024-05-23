class BookmarksController < ApplicationController
  
  def create
    @bookmark = Bookmark.new(bookmark_params)
  end

  def new
    @bookmark = Bookmark.new
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.save
      redirect_to lists_path, notice: 'movie was successfully added'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
