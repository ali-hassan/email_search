require 'httparty'
class User < ApplicationRecord


  def self.search(email)
    response = HTTParty.get("http://apilayer.net/api/check?access_key=1a87bda4e25b3152177ec15a5482ac36&email=#{ email }&smtp=1&format=1")
    response["mx_found"]
  end
end
