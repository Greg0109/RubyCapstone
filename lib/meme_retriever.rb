require 'httparty'
require 'nokogiri'

class MemeRetriever
    def get_url_content
        unparsed_page = HTTParty.get('http://reddit.com/r/memes/.rss', {
            headers: {"User-Agent" => "Httparty"},
        })
        parsed_page = Nokogiri::XML(unparsed_page) 
        parsed_page
    end
    
    def get_memes
        meme_array = Array.new
        xml_content = get_url_content.to_s.split('<entry>')
        for x in xml_content
            if x.include?('author')
                link = x.split('type="html"')
                content = link[1].to_s.split('</content>')
                url = content[0].split('&gt')
                for y in url
                    if y.to_s.include?("jpg") && y.to_s.include?("href")
                        meme_link = y.scan(/"([^"]*)"/)
                        meme_array.push(meme_link)
                    end
                end
            end
        end
        meme_array
    end
end