
class Request < ApplicationRecord
    after_create :serial_request
    belongs_to :job

    private
        
    def serial_request
        self.update(request_serial: "RQ-#{self.id.to_s.rjust(4, "0")}")
    end
end
