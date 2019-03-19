class ApplicationController < ActionController::API
  require 'net/http'
  require 'uri'

  def location
    puts "in the location route #{params[:loc]}"
    location = params[:loc]
    google_uri = URI("https://maps.googleapis.com/maps/api/geocode/json?address=#{location}&key=#{ENV["GOOGLE_KEY"]}")
    res = Net::HTTP.get_response(google_uri)
    render plain: res.body.squish

  end

  def weather
    puts "in the weather route #{params[:loc]}"
    
    location = params[:loc].gsub('"', '')
    lat = location.split('_')[0]
    lng = location.split('_')[1]
    dark_sky_uri = URI("https://api.darksky.net/forecast/#{ENV["DARK_SKY_KEY"]}/#{lat},#{lng}")
    res = Net::HTTP.get_response(dark_sky_uri)
    render plain: res.body.squish
  end
  
end
