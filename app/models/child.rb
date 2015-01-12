class Child < ActiveRecord::Base

  has_many :checkpoints, dependent: :destroy

  validates :name, presence: true
  validates :age, presence: true

end
