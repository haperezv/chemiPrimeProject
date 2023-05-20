# == Schema Information
#
# Table name: extents
#
#  id         :bigint           not null, primary key
#  extent     :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Extent < ApplicationRecord
    validates :extent, presence: { message: "Unit of measurement can't be blank" }
end
