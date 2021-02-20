require_relative '../lib/api.rb'

RSpec.describe API do
  client = API.new
  describe '#post_meme' do
    it 'Returns the error if link is not provided' do
      expect(client.post_meme('test')).to eql('Argument provided is not a link')
    end

    it 'Returns true if link is provided' do
      expect(client.post_meme('https://preview.redd.it/c3yrl2k02ii61.jpg?width=640&crop=smart&auto=webp&s=0a1c44d9174b049092b2324d8194021e7f7df699')).to eql(true)
    end
  end
end
