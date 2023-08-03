class BookComment < ApplicationRecord
  
  validates :comment, presence: true
  
  belongs_to :book
  belongs_to :user
  
end
