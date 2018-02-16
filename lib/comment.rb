class Comment
  attr_reader :link_id, :text

  def initialize(link_id, text)
    @link_id = link_id
    @text = text
  end

  def self.all_by_id(link_id)
    result = DatabaseConnection.query("SELECT * FROM comments WHERE link_id='#{link_id}'")
    result.map{ |comment| Comment.new(comment['link_id'], comment['text']) }
  end

  def self.create(link_id, text)
    DatabaseConnection.query("INSERT INTO comments (link_id, text) VALUES ('#{link_id}', '#{text}');")
  end
end
