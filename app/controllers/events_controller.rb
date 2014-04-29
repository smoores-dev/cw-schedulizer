class EventsController < ApplicationController
  before_action :signed_in_employee
  before_action :exec, only: [:new, :create, :destroy]
  before_action :not_testing

  def index
    @events = Event.paginate(page: params[:page])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "Event added to calendar."
    end
    render 'index'
  end

  def edit
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = "Event updated"
    end
    render 'index'
  end

  def destroy
    Event.find(params[:id]).destroy
    flash[:success] = "Event deleted"
    redirect_to events_url
  end

  def show
    @event = Event.find(params[:id])
  end

  private

    def event_params
      params.require(:event).permit(:place, :date, :start)
    end

    def not_testing
      if current_employee.netID == 'test123'
        redirect_to '/test#index'
      end
    end

end
