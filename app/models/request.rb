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
class Request < ApplicationRecord
    after_create :serial_request
    belongs_to :job
    extend FriendlyId
    friendly_id :request_serial, use: :slugged
    
    validates :request_date, presence: { message: "La fecha de solicitud no puede estar vacía" }
    validates :job_time, presence: { message: "La fecha de trabajo no puede estar vacía" }
    validates :location, presence: { message: "La ubicación no puede estar vacía" }
    validates :well_name, presence: { message: "El nombre del pozo no puede estar vacío" }
    validates :customer_id, presence: { message: "El cliente no puede estar vacío"}
    validates :sample_id, presence: { message: "La muestra no puede estar vacía"}
    validates :extent_id, presence: { message: "La extensión no puede estar vacía"}
    validates :departament_id, presence: { message: "El departamento no puede estar vacío"}
    validates :job_id, presence: { message: "El trabajo no puede estar vacío"}
    validates :pipe_size, presence: { message: "El tamaño de la tubería no puede estar vacío"}
    validates :bhst, presence: { message: "El BHST no puede estar vacío"}

    private
        
    def serial_request
        self.update(request_serial: "RQ-#{self.id.to_s.rjust(4, "0")}")
    end
end
