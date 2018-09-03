# == Schema Information
#
# Table name: vehicles
#
#  id         :integer          not null, primary key
#  fuelType   :string
#  make       :string
#  model      :string
#  range      :string
#  rangeCity  :string
#  year       :string
#  VClass     :string
#  cylinders  :string
#  displ      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Vehicle < ApplicationRecord
  scope :makes, -> { select('distinct make') }
  scope :models_for, ->(make) { where('make like ?', "%#{make}%").select('distinct model') }

  def self.make_year_for(model)
    self.where('model like ?', "%#{model}%").first&.year
  end

  def self.import!
    CSV.foreach(Rails.root.join('db/vehicles.csv'), headers: true) do |row|
      Vehicle.create! row.to_hash.slice('fuelType', 'make', 'model', 'range', 'rangeCity', 'year', 'VClass', 'cylinders', 'displ')
      print '.'.green
    end
  end
end
