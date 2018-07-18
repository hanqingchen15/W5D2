class Postsub < ApplicationRecord
  belongs_to :subs,
  foreign_key: :sub_id,
  class_name: :Sub
  
  belongs_to :posts,
    foreign_key: :post_id,
    class_name: :Post
end
