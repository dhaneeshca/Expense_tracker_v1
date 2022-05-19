class AuthenticationTokenService < ApplicationController
    HMAC_SECRET = "Expendables"
    ALGORITHM_TYPE = "HS256"

    def self.encode(employee_id)
        payload = {employee_id: employee_id}
        JWT.encode(payload, HMAC_SECRET, ALGORITHM_TYPE)
    end

    def self.decode(token)
            decoded_token = JWT.decode token, HMAC_SECRET, true, {algorithm: ALGORITHM_TYPE}
            emp_id = decoded_token[0]["employee_id"]
            Employee.find(emp_id)
        rescue ActiveRecord::RecordNotFound
            return false
        rescue Exception => e
            return false
        true
    end

end
