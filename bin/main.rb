require 'twitter'
require 'open-uri'
require_relative '../lib/api.rb'
require_relative '../lib/meme_retriever.rb'

while true
  client = API.new
  memes = MemeRetriever.new
  time = 1800
  for x in memes.get_memes
    link = x.to_s.delete('["]')
    client.post_meme(link)
    puts "Meme posted in https://twitter.com/greg_0109 Waiting #{time} seconds for next meme"
    sleep(time) # Sleep 30 min between memes
    end
end
