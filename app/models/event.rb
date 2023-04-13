class Event < ApplicationRecord
  validates :title, :description, :location, :date, :time, :image, presence: true
end
