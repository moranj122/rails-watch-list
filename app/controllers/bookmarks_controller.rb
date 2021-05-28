class BookmarksController < ApplicationController
  # before_action :find_link, only: [:create]
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    list = bookmark.lists
    @bookmark.destroy
    redirect_to list_path(list)
  end

  private

  # def find_link
  #   @bookmark = Bookmark.find(params[:id])
  # end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
