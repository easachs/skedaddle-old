# frozen_string_literal: true

class Restaurant < ApplicationRecord
  validates :name,
            :rating,
            :price,
            :image_url,
            :url,
            :categories,
            :address,
            :phone, presence: true
  belongs_to :itinerary
end
