require 'net/http'

class TrendSpottr < ActiveRecord::Base
  @@USERNAME = "hackto"
  @@PASSWORD = "HT2012"
  @@URL = "http://trendspottr.com/api/v1.1/search.php"
  
  def self.query( q )
    trendspottr_uri = URI(@@URL)
    params = { :q => q}
    trendspottr_uri.query = URI.encode_www_form(params)
    
    request = Net::HTTP::Get.new(trendspottt_uri.request_uri)
    request.basic_auth @@USERNAME, @@PASSWORD
    
    response = Net::HTTP.start(trendspottr_uri.hostname, trendspottr_uri.port) {|http|
      http.request(request)
    }
    
    puts response.body
    #response_data = Net::HTTP.get_response(trendspottr_uri)
    #json_data = JSON.parse(response_data.body) if response_data.is_a?(Net::HTTPSuccess)
  end
  
  
  
end
