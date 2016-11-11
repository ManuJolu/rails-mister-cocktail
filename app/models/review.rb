class Review < ApplicationRecord
  belongs_to :cocktail
  validates :rating, presence: true
  validates :rating, numericality: true, inclusion: { in: (0..5).to_a, allow_nil: false }

  def stars
    (('<i class="fa fa-star"></i>' * rating) + ('<i class="fa fa-star-o"></i>' * (5 - rating))).html_safe
  end
end
