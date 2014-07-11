module API
  class APIController < ActionController::Metal
    include ActionController::HttpAuthentication::Basic::ControllerMethods

    def authenticate
      employee = nil
      authenticate_with_http_basic do |u, p|
        e = Employee.find_by netID: u
        employee = e if e && e.authenticate(p)
      end
      if employee
        @current_employee = employee
      else
        request_http_basic_authentication
      end
    end
  end
end