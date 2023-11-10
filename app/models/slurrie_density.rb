# == Schema Information
#
# Table name: slurrie_densities
#
#  id               :bigint           not null, primary key
#  slurrie_densitie :float
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  extent_id        :bigint
#  request_id       :bigint           not null
#
class SlurrieDensity < ApplicationRecord    
    belongs_to  :request
    belongs_to  :extent
end
