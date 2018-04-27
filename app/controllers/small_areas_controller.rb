class SmallAreasController < ApplicationController
  def index
    @small_areas = SmallArea.where(middle_area_code: params[:area_id])
  end

  def show
    @small_area = SmallArea.where(small_area_code: params[:id])[0]
  end

end

