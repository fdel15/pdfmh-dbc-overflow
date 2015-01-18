class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :tags
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates_presence_of :body
  validates_presence_of :title
  validates_presence_of :user_id

  def vote_count
    self.votes.where(upvote: true).count - self.votes.where(upvote: false).count
  end

  def create_tags(string)
    string.split(',').map{ |tag| self.tags.create(name: tag)}
  end

  def display_tags
    self.tags.map{ |tag| tag.name.strip}.uniq.join(", ")
  end

  def self.search(words)
    matches = []
    words.split(' ').each do |word|
      matches << Question.all.select { |q| q.title.downcase.include?(word.downcase) || q.body.downcase.include?(word.downcase) }
    end
    matches.flatten.uniq
  end
end
