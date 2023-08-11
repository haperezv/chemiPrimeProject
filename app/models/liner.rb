# == Schema Information
#
# Table name: liners
#
#  id    :bigint           not null, primary key
#  datoa :float
#  datob :float
#
class Liner < ApplicationRecord
    belongs_to :request
end
