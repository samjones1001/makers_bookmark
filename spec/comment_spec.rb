require 'comment'

describe Comment do
  describe '.all_by_id' do
    it 'returns comments with the passed link id' do
      Comment.create('1', 'this comment should be returned')
      Comment.create('2', 'this comment should not be returned')
      comments = Comment.all_by_id(1).map{ |comment| comment.text }
      expect(comments).to include('this comment should be returned')
      expect(comments).to_not include('this comment should not be returned')
    end
  end

  describe '.create' do
    it 'creates a new comment' do
      Comment.create('1', 'this is a comment')
      comments = Comment.all_by_id(1).map { |comment| comment.text }
      expect(comments).to include('this is a comment')
    end
  end
end
