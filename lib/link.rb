require 'pg'
require 'uri'

class Link
  def self.all
    result = DatabaseConnection.query('SELECT * FROM links')
    result.map{ |link| link['url'] }
  end

  def self.create(url)
    return false unless is_valid?(url)
    DatabaseConnection.query("INSERT INTO links (url) VALUES ('#{url}');")
  end

  def self.is_valid?(url)
    return true if url =~ /\A#{URI::DEFAULT_PARSER.regexp[:ABS_URI]}\z/
    false
  end
end
