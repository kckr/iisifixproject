# == Schema Information
#
# Table name: data_stores
#
#  id                  :integer          not null, primary key
#  metadata            :json
#  registration_number :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class DataStore < ApplicationRecord
  store :metadata, accessors: [:description,
                               :registration_year,
                               :make, :make_description,
                               :model, :model_description,
                               :vin, # Vehicle Indentification Number
                               :insurer,
                               :tow_bar]




end
