# rubocop:disable Layout/LineLength

require_relative '../lib/api.rb'

RSpec.describe API do
  client = API.new
  describe '#post_meme' do
    it 'Returns the error if link is not provided' do
      expect(client.post_meme('test')).to eql('Argument provided is not a link')
    end
  end
end

# rubocop:enable Layout/LineLength
