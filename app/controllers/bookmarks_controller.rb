class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id]) # In routes, it's nested so needs to be passed an id
  end

  def create
    @bookmark = Bookmark.new(bookmark_params) # New instance of bookmark with comment & movie_id
    @list = List.find(params[:list_id]) # Find the list id to include (as this isn't inputted by user)
    @bookmark.list = @list # Assign this to the list of the bookmark instance
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list
    @bookmark.destroy
    redirect_to list_path(@list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
