# == Schema Information
#
# Table name: payment_options
#
#  id          :integer          not null, primary key
#  name        :string
#  icon_class  :string
#  type        :string
#  description :string
#  metadata    :jsonb
#  status      :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PaymentOption < ApplicationRecord
  self.inheritance_column = nil
end
