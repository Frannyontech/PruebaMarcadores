class HomeController < ApplicationController
  def index
    @bookmarks = Bookmark.all.order(name: :desc)
    @categories = Category.all.order(name: :desc)
  end
end
