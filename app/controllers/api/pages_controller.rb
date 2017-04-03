class Api::PagesController < ApplicationController
  def index
    @pages = Page.paginate(page: params[:page])

    render json: @pages
  end

  def show
    @pages = Page.find(params[:id])

    render json: @pages
  end
end
