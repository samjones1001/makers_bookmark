require 'link'

describe Link do
  describe '.all' do
    it 'returns a list of links' do
      links = Link.all
      expect(links).to include('http://www.makersacademy.com')
      expect(links).to include('http://www.google.com')
    end
  end

  describe '.create' do
    it 'adds a link to the list' do
      Link.create('http://www.mylovelywebsite.com')
      expect(Link.all).to include('http://www.mylovelywebsite.com')
    end
  end
end
