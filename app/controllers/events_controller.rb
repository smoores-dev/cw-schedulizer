class EventsController < ApplicationController
  before_action :signed_in_employee
  # before_action :exec, only: [:new, :create, :edit, :update, :destroy]

  def index
    @events = Event.all
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
    if @event.update_attributes(event_params)
      flash[:success] = "Event updated"
    end
    render 'edit'
  end

  def destroy
    Event.find(params[:id]).destroy
    flash[:success] = "Event deleted"
    redirect_to events_url
  end

  private

    def event_params
      params.require(:event).permit(:place, :date, :start)
    end

end
