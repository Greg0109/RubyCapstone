require 'twitter'

class API
    def get_client
        client = Twitter::REST::Client.new do |config|
            config.consumer_key        = ""
            config.consumer_secret     = ""
            config.access_token        = ""
            config.access_token_secret = ""
        end
    end
end