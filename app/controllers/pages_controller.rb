class PagesController < ApplicationController
  def index
    @pages = Page.paginate(page: params[:page])
  end

  def new
    @page = Page.new
  end
end
