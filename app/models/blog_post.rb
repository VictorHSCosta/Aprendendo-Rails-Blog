class BlogPost < ApplicationRecord
  validates :tittle , presence: true
  validates :body , presence: true
end
