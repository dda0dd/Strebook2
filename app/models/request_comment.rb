class RequestComment < ApplicationRecord
  validates :content, presence:true

  belongs_to :customer

  def self.looks(search, word)
    if search == "perfect_match"
      @request_comments = RequestComment.where("title LIKE ?", "#{word}")
    elsif search == "forward_match"
      @request_comments = RequestComment.where("title LIKE ?", "#{word}%")
    elsif search == "backward_match"
      @request_comments = RequestComment.where("title LIKE ?", "%#{word}")
    elsif search == "partial_match"
      @request_comments = RequestComment.where("title LIKE ?", "%#{word}%")
    else
      @request_comments = RequestComment.all
    end
  end
end
