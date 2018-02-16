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
      link = Link.find('1')
      expect(link.url).to eq('http://www.makersacademy.com')
    end
  end

  describe '.update' do
    it 'updates a link in the list' do
      Link.update('1', 'http://www.mywonderfulwebsite.com', 'Wonderful Website')
      urls = Link.all.map{ |link| link.url }
      titles = Link.all.map{ |link| link.title }
      expect(urls).to_not include('http://www.makersacademy.com')
      expect(urls).to include('http://www.mywonderfulwebsite.com')
      expect(titles).to_not include("Lovely Website")
      expect(titles).to include('Wonderful Website')
    end
  end

  describe '.delete' do
    it 'removes a link from the list' do
      Link.delete('1')
      urls = Link.all.map{ |link| link.url }
      expect(urls).to_not include('http://www.makersacademy.com')
    end
  end

  describe 'get_comments' do
    it 'returns a list of comments belonging to the link' do
      link = Link.find('1')
      comment = Comment.create(link.id, 'this is so lovely')
      comment_2 = Comment.create('2', 'this is a comment for a different link')
      comments = link.get_comments.map{ |comment| comment.text }
      expect(comments).to include('this is so lovely')
      expect(comment).to_not include('this is a comment for a different link')
    end
  end
end
