class ThoughtseComment < ApplicationRecord
  validates :content, presence:true

  belongs_to :customer
  belongs_to :post
end
