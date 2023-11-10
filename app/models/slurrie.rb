# == Schema Information
#
# Table name: slurries
#
#  id            :bigint           not null, primary key
#  concentration :float
#  lote          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  request_id    :bigint           not null
#  aditivo_id    :bigint
#  extent_id     :bigint
#
class Slurrie  < ApplicationRecord
    belongs_to  :request
    belongs_to   :aditivo
    belongs_to   :extent
end
