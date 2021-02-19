require 'twitter'
require 'open-uri'
require_relative '../lib/api.rb'
require_relative '../lib/meme_retriever.rb'

def post_meme(link)
  client_api = API.new
  client = client_api.get_client
  URI.open(link) do |image|
    File.open('./meme.jpg', 'wb') do |file|
      file.write(image.read)
    end
  end
  client.update_with_media('Dank Meme!', File.open('./meme.jpg', 'r+'))
  puts 'Meme posted in https://twitter.com/greg_0109'
end

while true
  memes = MemeRetriever.new
  for x in memes.get_memes
    link = x.to_s.delete('["]')
    post_meme(link)
    sleep(1800) # Sleep 30 min between memes
    end
end
