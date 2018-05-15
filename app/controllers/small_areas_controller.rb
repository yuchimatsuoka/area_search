class SmallAreasController < ApplicationController
  def index
    if params[:query] == "price_desc" then
      # @small_areas = SmallArea.where~~~ .orderby(average_prices)
      @small_areas = SmallArea.where(area_id: params[:area_id]).order('price_mean desc')
    elsif params[:query] == "price_asc" then
      @small_areas = SmallArea.where(area_id: params[:area_id]).order('price_mean asc')
    elsif params[:query] == "count_desc" then
      @small_areas = SmallArea.where(area_id: params[:area_id]).order('count desc')
    elsif params[:query] == "count_asc" then
      @small_areas = SmallArea.where(area_id: params[:area_id]).order('count asc')
    else
      @small_areas = SmallArea.where(area_id: params[:area_id])
    end

    @average_prices = {}
    @shops_counts = {}

    @small_areas.each do |small_area|
      @average_prices[small_area.small_area_name]=small_area.price_mean
      @shops_counts[small_area.small_area_name]=small_area.count
    end
  end

  def show
    # binding.pry
    @small_area = SmallArea.find(params[:id])
    @posts = @small_area.posts
    @open_shops_number = { "16時" => @small_area.o16,
                          "17時" => @small_area.o17,
                          "18時" => @small_area.o18,
                          "19時" => @small_area.o19,
                          "20時" => @small_area.o20,
                          "21時" => @small_area.o21,
                          "22時" => @small_area.o22,
                          "23時" => @small_area.o23,
                          "24時" => @small_area.o24,
                          "1時" => @small_area.o25,
                          "2時" => @small_area.o26,
                          "3時" => @small_area.o27,
                          "4時" => @small_area.o28,
                          "5時" => @small_area.o29  }


    #@posts = SmallArea.where(small_area_code: params[:id])[0].posts
    @food_genres = @small_area.shops.group(:food_name).count.sort{|(k1, v1), (k2, v2)| v2 <=> v1 }.to_h
    if @food_genres.length > 8 then
      top = @food_genres.to_a[1..8]
      sonota = @food_genres.to_a[8..-1].to_h.values.sum
      top << ["その他",sonota]
      @food_genres = top
    end

    @price_bunpu = @small_area.shops.group(:rep_price).count

      # binding.pry
  end


end

