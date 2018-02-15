require 'link'

describe Link do
  describe '.all' do
    it 'returns a list of links' do
      links = Link.all
      urls = links.map{ |link| link.url }
      expect(urls).to include('http://www.makersacademy.com')
      expect(urls).to include('http://www.google.com')
    end
  end

  describe '.create' do
    it 'adds a link to the list' do
      Link.create('http://www.mylovelywebsite.com', 'Lovely Website')
      urls = Link.all.map{ |link| link.url }
      expect(urls).to include('http://www.mylovelywebsite.com')
    end

    it 'does not add the link if it is not valid' do
      Link.create('not a url', 'not a website')
      expect(Link.all).to_not include('not a url')
    end
  end

  describe '.is_valid?' do
    it 'returns true if passed a vaild url' do
      expect(Link.is_valid?('http://www.mylovelywebsite.com')).to be(true)
    end

    it 'returns false if passed an invalid url' do
      expect(Link.is_valid?('not a url')).to be(false)
    end
  end
end
