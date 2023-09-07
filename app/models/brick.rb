class Brick < ApplicationRecord
  acts_as_votable

  validates :title, presence: true, length: { minimum: 3 }
  validates :content, presence: true, length: { minimum: 10 }

  belongs_to :user

  def total_votes
    upvotes = self.get_upvotes.size
    downvotes = self.get_downvotes.size
    upvotes - downvotes
  end
end
