# == Schema Information
#
# Table name: casings
#
#  id     :bigint           not null, primary key
#  depth  :float            not null
#  casing :float            not null
#  valor  :float            not null
#
class Casing < ApplicationRecord
    belongs_to :request
end
