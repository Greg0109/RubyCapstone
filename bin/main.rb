# rubocop:disable Style/For
# rubocop:disable Style/InfiniteLoop

require 'twitter'
require 'open-uri'
require_relative '../lib/api.rb'
require_relative '../lib/meme_retriever.rb'

while true
  client = API.new
  memes = MemeRetriever.new
  time = 1800
  meme_array = memes.get_memes
  if meme_array.count.positive?
    for x in meme_array
      puts client.post_meme(x)
      puts "Meme posted in https://twitter.com/greg_0109 Waiting #{time} seconds for next meme"
      sleep(time) # Sleep 30 min between memes
      end
  else
    puts 'Something went wrong with the API. Please try again later'
    exit
  end
end

# rubocop:enable Style/For
# rubocop:enable Style/InfiniteLoop
