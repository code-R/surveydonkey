class Survey < ActiveRecord::Base
  attr_accessible :description, :title

  validates :title, :description, presence: true

  has_many :questions, dependent: :destroy
end