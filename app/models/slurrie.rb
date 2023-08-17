# == Schema Information
#
# Table name: slurries
#
#  id            :bigint           not null, primary key
#  density       :float
#  concentration :float
#  lote          :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  request_id    :bigint           not null
#
class Slurrie  < ApplicationRecord
    belongs_to  :request
    belongs_to   :aditivo
    belongs_to   :extent
end
