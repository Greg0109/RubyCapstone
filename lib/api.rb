require 'twitter'
require 'open-uri'

class API
  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = 'API-Key'
      config.consumer_secret = 'API-Key secret'
      config.access_token = 'Access Token'
      config.access_token_secret = 'Access Token Secret'
    end
  end

  def post_meme(meme)
    title = meme[0].to_s
    link = meme[1].to_s
    link = link.delete('["]')
    if link.include?('https')
      URI.open(link) do |image|
        File.open('./meme.jpg', 'wb') do |file|
          file.write(image.read)
        end
      end
      @client.update_with_media("#{title}", File.open('./meme.jpg', 'r+'))
      return true
    else
      'Argument provided is not a link'
    end
  end
end
