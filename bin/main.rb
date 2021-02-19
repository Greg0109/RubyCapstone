require 'twitter'
require 'open-uri'
require_relative '../lib/api.rb'
require_relative '../lib/meme_retriever.rb'

while true
  client = API.new
  memes = MemeRetriever.new
  for x in memes.get_memes
    link = x.to_s.delete('["]')
    client.post_meme(link)
    sleep(10) # Sleep 30 min between memes
    end
end
