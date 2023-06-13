# == Schema Information
#
# Table name: requests
#
#  id                   :bigint           not null, primary key
#  request_date         :date             not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  request_serial       :string
#  job_time             :date             not null
#  job_id               :bigint           not null
#  location             :string           not null
#  customer_id          :bigint           not null
#  sample_id            :bigint           not null
#  extent_id            :bigint           not null
#  departament_id       :bigint           not null
#  well_name            :string           not null
#  slug                 :string
#  pipe_size            :float            not null
#  bhst                 :float            not null
#  temperature_gradient :float            not null
#  depth_md             :float            not null
#  depth_tvd            :float            not null
#  psi                  :float            not null
#  bhct                 :float            not null
#  time_mezcla          :text             not null
#
require "test_helper"

class RequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
