# == Schema Information
#
# Table name: jobs
#
#  id         :bigint           not null, primary key
#  job_type   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Job < ApplicationRecord
    validates :job_type, presence: { message: "Job type can't be blank" }
end
