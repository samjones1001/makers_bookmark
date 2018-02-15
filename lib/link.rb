require 'pg'
require 'uri'

class Link
  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM links')
    result.map{ |link| Link.new(link['id'], link['url'], link['title']) }
  end

  def self.create(url, title)
    return false unless is_valid?(url)
    DatabaseConnection.query("INSERT INTO links (url, title) VALUES ('#{url}', '#{title}');")
  end

  def self.is_valid?(url)
    return true if url =~ /\A#{URI::DEFAULT_PARSER.regexp[:ABS_URI]}\z/
    false
  end
end
