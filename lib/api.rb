require 'twitter'

class API
  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = 'API-Key'
      config.consumer_secret = 'API-Key secret'
      config.access_token = 'Access Token'
      config.access_token_secret = 'Access Token Secret'
    end
  end

  def post_meme(link)
    if link.include?('http')
      URI.open(link) do |image|
        File.open('./meme.jpg', 'wb') do |file|
          file.write(image.read)
        end
      end
      @client.update_with_media('Dank Meme!', File.open('./meme.jpg', 'r+'))
    else
      'Argument provided is not a link'
    end
  end
end
