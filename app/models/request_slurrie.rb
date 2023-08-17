# == Schema Information
#
# Table name: request_slurries
#
#  id         :bigint           not null, primary key
#  request_id :bigint           not null
#  slurrie_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class RequestSlurrie  < ApplicationRecord
    belongs_to :request
    belongs_to :slurrie
end
