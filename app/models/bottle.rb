class Bottle < ActiveRecord::Base
  validates :name, :color, presence: true
end
