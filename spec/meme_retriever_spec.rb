require_relative '../lib/meme_retriever.rb'

RSpec.describe MemeRetriever do
  meme_retriever = MemeRetriever.new
  describe '#get_url_content' do
    it 'Returns the content of the URL using the scrapper' do
      expect(meme_retriever.get_url_content).to be_an_instance_of(Nokogiri::XML::Document)
    end
  end

  describe '#get_memes' do
    it 'Returns an array of links of memes' do
      expect(meme_retriever.get_memes).to be_an_instance_of(Hash)
    end
  end
end
