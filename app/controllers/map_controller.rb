require 'http_get'

class MapController < ApplicationController

  def search
    @title = "Show me the way!"
    @has_search_result = false
    return if params[:map].nil?
    search_from_google_map
  end

  def search_from_google_map
    start_address = params[:map][:start_address]
    end_address = params[:map][:end_address]
    domain = "maps.googleapis.com"
    path = "/maps/api/directions/json"
    params = {:origin => start_address, :destination => end_address, :sensor => "false"}
    json_result = http_get(domain, path, params)
    @search_result = ActiveSupport::JSON.decode(json_result)
    @has_search_result = true if @search_result["status"]  == "OK"
  end
end
