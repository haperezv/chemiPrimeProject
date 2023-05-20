# == Schema Information
#
# Table name: samples
#
#  id         :bigint           not null, primary key
#  sample     :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Sample < ApplicationRecord
    validates :sample, presence: { message: "Fluid Density can't be blank" }
end
