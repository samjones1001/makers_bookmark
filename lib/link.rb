require 'pg'

class Link
  def self.all
    connection = PG.connect :dbname => 'bookmark_manager'
    result = connection.exec('SELECT * FROM links')
    return result.map{ |link| link['url'] }
  end
end
