class Post < ApplicationRecord
  validates :title, presence: true
   
  belongs_to :author, 
    foreign_key: :author_id,
    class_name: :User
    
  has_many :postsubs,
  foreign_key: :post_id,
  class_name: :Postsub,
  dependent: :destroy,
  inverse_of: :post
  
  has_many :subs,
  through: :postsubs,
  source: :subs
end