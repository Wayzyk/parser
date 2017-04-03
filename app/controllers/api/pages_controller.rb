class Api::PagesController < ApplicationController
  def index
    @pages = Page.paginate(page: params[:page])

    render json: @pages
  end

  def show
    @page = Page.find(params[:id])

    render json: @page
  end
end
