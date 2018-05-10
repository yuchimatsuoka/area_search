class AreasController < ApplicationController
  def index
    @areas = Area.all
    # @average_prices = {}
    # @areas.each do |area|
    #   @average_prices[area.shopsarea_name]=area.price_mean
    # end
    # binding.pry
    @average_prices = {}
    @areas.each do |area|
      @average_prices[area.middle_area_name]=area.price_mean
    end

    # 営業時間
    @tetsuya_areas_rate = []
    if params[:tetsuya] == 'or24' then
      @tetsuya_areas= SmallArea.order("or24 DESC").limit(5)
      @tetsuya_areas.each do |tetsuya_area|
        @tetsuya_areas_rate << tetsuya_area.or24
      end
    elsif params[:tetsuya] == 'or25' then
      @tetsuya_areas= SmallArea.order("or25 DESC").limit(5)
      @tetsuya_areas.each do |tetsuya_area|
        @tetsuya_areas_rate << tetsuya_area.or25
      end
    elsif params[:tetsuya] == 'or26' then
      @tetsuya_areas= SmallArea.order("or26 DESC").limit(5)
      @tetsuya_areas.each do |tetsuya_area|
        @tetsuya_areas_rate << tetsuya_area.or26
      end
    elsif params[:tetsuya] == 'or27' then
      @tetsuya_areas= SmallArea.order("or27 DESC").limit(5)
      @tetsuya_areas.each do |tetsuya_area|
        @tetsuya_areas_rate << tetsuya_area.or27
      end
    elsif params[:tetsuya] == 'or28' then
      @tetsuya_areas= SmallArea.order("or28 DESC").limit(5)
      @tetsuya_areas.each do |tetsuya_area|
        @tetsuya_areas_rate << tetsuya_area.or28
      end
    elsif params[:tetsuya] == 'or29' then
      @tetsuya_areas= SmallArea.order("or29 DESC").limit(5)
      @tetsuya_areas.each do |tetsuya_area|
        @tetsuya_areas_rate << tetsuya_area.or29
      end
    end

    # じゃんる
    if params[:food] != nil then
      # @recom_areas = SmallArea.where("food_name = params[:food]")
      @f_name =params[:food]
      @food_areas = SmallArea.all.order("#{@f_name} DESC").limit(5)
      # binding.pry
    end


    if params[:origin1] != nil then
      require 'net/http'
      require 'uri'
      require 'json'
      require 'daru'
      destinations=[]
      @small_areas= SmallArea.order("count DESC").limit(18)
      @small_areas.each do |small_area|
        destinations << small_area["small_area_name"]
      end
      origins=[params[:origin1],params[:origin2]]
      uri = URI('https://maps.googleapis.com/maps/api/distancematrix/json')
      params = {:key=> "AIzaSyCPoYp9LLj-vIWtwIgpNcDgv4QLrUzWq7Y",
        :origins => origins.join("|"),
        :destinations =>destinations.join("|"),
        :mode => "train",
        :language => "ja"}
      uri.query = URI.encode_www_form(params)

      res = Net::HTTP.get_response(uri)
      parsed = JSON.parse(res.body)
      # puts parsed['rows'][0]
      dur_text0=[]
      dur_value0=[]
      dur_text1=[]
      dur_value1=[]
      for i in 0..destinations.length-1
        dest0=parsed['rows'][0]['elements'][i]
        dest1=parsed['rows'][1]['elements'][i]
        if dest0['status'] =='OK' then
          dur_text0 << dest0['duration']['text']
          dur_value0 << dest0['duration']['value']
          dur_text1 << dest1['duration']['text']
          dur_value1 << dest1['duration']['value']
        else
          dur_text0 << 'null'
          dur_value0 << 100000000000
          dur_text1 << 'null'
          dur_value1 << 100000000000
        end
      end
        if dur_text0.uniq.length ==1 then
          @status= "fail"
        else
          @status= "success"
        end
        df= Daru::DataFrame.new(
          "dest" => destinations,
          "dur_text0" => dur_text0,
          'dur_value0' => dur_value0,
          "dur_text1" => dur_text1,
          "dur_value1" => dur_value1
          )
        df['sum'] = df['dur_value0']+df['dur_value1']
        df = df.sort(["sum"],ascending: true)
        @recom_dest = Array(df['dest'])
        @recom_dur0 = Array(df['dur_text0'])
        @recom_dur1 = Array(df['dur_text1'])
         # binding.pry
    end
    # binding.pry
    # if params[:tetsuya] != nil then
    #   @tetsuya_areas= SmallArea.order("o28 DESC").limit(5)
    # end
      #binding.pry
  end
end

