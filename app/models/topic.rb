require 'paginate'

class Topic < ApplicationRecord
  has_many :posts
end
