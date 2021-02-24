# rubocop:disable Naming/AccessorMethodName

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
      'Cannot retrieve content from the web. Please try again later'
    end
  end

  def get_memes
    meme_array = Hash.new
    xml_content = get_url_content.to_s.split('<entry>')
    xml_content.each do |x|
      next unless x.include?('author')

      link = x.split('type="html"')
      content = link[1].to_s.split('</content>')
      title_filter = link[1].to_s.split('title=')
      title = title_filter[0].split('alt=')
      title = title[1]
      url = content[0].split('&gt')
      url.each do |y|
        if y.to_s.include?('jpg') && y.to_s.include?('href')
          meme_link = y.scan(/"([^"]*)"/)
          meme_array.store(title,meme_link)
        end
      end
    end
    meme_array
  end
end

# rubocop:enable Naming/AccessorMethodName
