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

  describe '.find' do
    it 'retrieves the correct link from the db' do
      link = Link.find('http://www.makersacademy.com')
      expect(link.url).to eq('http://www.makersacademy.com')
    end
  end

  describe '.update' do
    it 'updates a link in the list' do
      Link.create('http://www.mylovelywebsite.com', 'Lovely Website')
      Link.update('http://www.mylovelywebsite.com', 'http://www.mywonderfulwebsite.com', 'Wonderful Website')
      urls = Link.all.map{ |link| link.url }
      titles = Link.all.map{ |link| link.title }
      expect(urls).to_not include('http://www.mylovelywebsite.com')
      expect(urls).to include('http://www.mywonderfulwebsite.com')
      expect(titles).to_not include("Lovely Website")
      expect(titles).to include('Wonderful Website')
    end
  end

  describe '.update' do
    it 'removes a link from the list' do
      Link.create('http://www.mylovelywebsite.com', 'Lovely Website')
      Link.delete('http://www.mylovelywebsite.com')
      urls = Link.all.map{ |link| link.url }
      expect(urls).to_not include('http://www.mylovelywebsite.com')
    end
  end


end
