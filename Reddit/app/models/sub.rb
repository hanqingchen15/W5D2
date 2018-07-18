class Sub < ApplicationRecord
  belongs_to :moderators,
  foreign_key: :moderator_id,
  class_name: :User
  
  has_many :postsubs,
  foreign_key: :sub_id,
  class_name: :Postsub
  
  has_many :posts,
  through: :postsubs,
  source: :posts
end