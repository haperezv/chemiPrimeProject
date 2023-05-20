# == Schema Information
#
# Table name: customers
#
#  id         :bigint           not null, primary key
#  customer   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Customer < ApplicationRecord
    validates :customer, presence: { message: "Customer can't be blank" }
end
