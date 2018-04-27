class SmallAreasController < ApplicationController
  def index
    @small_areas = SmallArea.where(middle_id: params[:area_id])
    #binding.pry
  end

  def show
    @small_area = SmallArea.find(params[:id])
    @posts = @small_area.posts
    #@posts = SmallArea.where(small_area_code: params[:id])[0].posts
     #binding.pry
  end

end

