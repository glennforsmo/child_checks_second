class Checkpoint < ActiveRecord::Base

  belongs_to :child

  validates :checkpoint, presence: true

end
