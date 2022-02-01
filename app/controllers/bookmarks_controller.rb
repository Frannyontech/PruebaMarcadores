class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[ show edit update destroy ]

  # GET /bookmarks or /bookmarks.json
  def index
    @bookmarks = Bookmark.all
    @bookmark = Bookmark.new
    @bookmarks = Bookmark.all.order(name: :desc)
  end

  # GET /bookmarks/1 or /bookmarks/1.json
  def show
  end

  # GET /bookmarks/new
  def new
    @bookmark = Bookmark.new
  end

  def bookmarks_category
    @bookmarks = Bookmark.where(category: category_params)
    render json: @bookmarks.as_json(include: :category)
  end
  # GET /bookmarks/1/edit
  def edit
    @bookmark = Bookmark.find(params[:id])
    @types = Type.all
    @categories = Category.all
  end

  # POST /bookmarks or /bookmarks.json
  def create
    @bookmark = Bookmark.new(bookmark_params)

    respond_to do |format|
      if @bookmark.save
        
        format.js {}
      else
        format.html { redirect_to rooth_path, alert: "!!" }
        
      end
    end
  end

  # PATCH/PUT /bookmarks/1 or /bookmarks/1.json
  def update
    respond_to do |format|
      if @bookmark.update(bookmark_params)
        format.html { redirect_to bookmark_url(@bookmark), notice: "Bookmark was successfully updated." }
        format.json { render :show, status: :ok, location: @bookmark }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmarks/1 or /bookmarks/1.json
  def destroy
    @bookmark = Bookmark.find(bookmark_params)

    respond_to do |format|
      if @bookmark.destroy
        
        format.js {}
      else
        format.html { redirect_to rooth_path, alert: "!!" }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bookmark_params
      params.require(:bookmark).permit(:name, :url, :type_id, :category_id)
    end

    def category_params
      params.require(:category)
    end
end
