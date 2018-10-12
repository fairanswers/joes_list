class Category < ApplicationRecord
  has_many :posts, dependent: :delete_all
  validates :name, :length => { :minimum => 5, :maximum => 50}
end
