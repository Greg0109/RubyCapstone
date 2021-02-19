require 'httparty'
require 'nokogiri'

class MemeRetriever
  def get_url_content
    unparsed_page = HTTParty.get('http://reddit.com/r/memes/.rss', {
                                   headers: { 'User-Agent' => 'Httparty' }
                                 })
    if !unparsed_page.body.nil? || !unparsed_page.body.empty?
      parsed_page = Nokogiri::XML(unparsed_page.body)
      parsed_page
    else
      puts "Cannot retrieve content from the web. Please try again later"
      exit
    end
  end

  def get_memes
    meme_array = []
    xml_content = get_url_content.to_s.split('<entry>')
    xml_content.each do |x|
      next unless x.include?('author')

      link = x.split('type="html"')
      content = link[1].to_s.split('</content>')
      url = content[0].split('&gt')
      url.each do |y|
        if y.to_s.include?('jpg') && y.to_s.include?('href')
          meme_link = y.scan(/"([^"]*)"/)
          meme_array.push(meme_link)
        end
      end
    end
    meme_array
  end
end
