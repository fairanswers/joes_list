class Post < ApplicationRecord
  belongs_to :category
  validates :title, :length => { :minimum => 5, :maximum => 50}
  validates :description, :length => { :minimum => 15, :maximum => 150}

  validate :inappropriate?

  def inappropriate?
    if description.include?("inappropriate")
      errors.add(:description, "can't be inappropriate")
    end
  end
end
