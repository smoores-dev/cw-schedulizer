module API
  class EventEmployeesAPIController < APIController
    include AbstractController::Callbacks
    before_action :authenticate

    def index
      self.response_body = EventEmployee.all.to_json
    end

    def destroy
      if EventEmployee.find_by(
        event_id: event_employee_params["event_id"],
        employee_id: event_employee_params["employee_id"]
      )
        EventEmployee.delete params[:event_employee_id]
        self.status ||= 200
        self.response_body ||= 'success'
      else
        self.status ||= 500
        self.response_body ||= 'No eventEmployee with that ID'
      end
    end

    def create
      event_employee = EventEmployee.new event_employee_params
      if event_employee.save
        self.status ||= 200
        self.response_body ||= 'success'
      else
        self.status ||= 500
        self.response_body ||= event_employee.errors.inspect
      end
    end

    def update
      event_employee = EventEmployee.find_by(
        event_id: event_employee_params["event_id"],
        employee_id: event_employee_params["employee_id"]
      )
      if event_employee
        if event_employee.update event_employee_params
          self.status ||= 200
          self.response_body ||= 'success'
        else
          self.status ||= 500
          self.response_body ||= event_employee.errors.inspect
        end
      else
        self.status ||= 500
        self.response_body ||= 'No event_employee with the given ID'
      end
    end

  private
    def event_employee_params
      params["event_employee"].slice("id", "employee_id", "event_id", "check_in", "check_out")
    end
  end
end