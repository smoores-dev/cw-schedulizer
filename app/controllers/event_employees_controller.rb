class EventEmployeesController < ApplicationController
  before_action :signed_in_employee

  def create
    @event = Event.find(params[:event_employee][:event_id])
    current_employee.signup!(@event)
    redirect_to edit_event_path(params[:event_employee][:event_id])
  end

  def destroy
    @event = EventEmployee.find(params[:id]).event
    current_employee.cancel!(@event)
    redirect_to events_path
  end
end