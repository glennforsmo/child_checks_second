class Checkpoint < ActiveRecord::Base

  belongs_to :child

  validates :checkpoint, presence: true #, inclusion: { in: %w(School Home Studies), message: "%{value} is not a valid size" }

end
