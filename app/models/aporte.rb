# == Schema Information
#
# Table name: aportes
#
#  id         :bigint           not null, primary key
#  aporte     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Aporte < ApplicationRecord
end
