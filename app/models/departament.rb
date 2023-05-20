# == Schema Information
#
# Table name: departaments
#
#  id          :bigint           not null, primary key
#  departament :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Departament < ApplicationRecord
    validates :departament, presence: { message: "Departament can't be blank" }
end
