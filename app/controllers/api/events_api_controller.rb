module API
  class EventsAPIController < APIController
    include AbstractController::Callbacks
    before_action :authenticate

    def index
      self.response_body = Event.all.to_json
    end

    def destroy
      if Event.find_by id: params[:event_id]
        Event.delete params[:event_id]
        self.status ||= 200
        self.response_body ||= 'success'
      else
        self.status ||= 500
        self.response_body ||= 'No event with that ID'
      end
    end

    def create
      event = Event.new event_params
      if event.save
        self.status ||= 200
        self.response_body ||= 'success'
      else
        self.status ||= 500
        self.response_body ||= event.errors.inspect
      end
    end

    def update
      event = Event.find_by id: event_params["id"]
      if event
        if event.update event_params
          self.status ||= 200
          self.response_body ||= 'success'
        else
          self.status ||= 500
          self.response_body ||= event.errors.inspect
        end
      else
        self.status ||= 500
        self.response_body ||= 'No event with the given ID'
      end
    end

  private
    def event_params
      params["event"].slice("id", "place", "date", "start", "phone_number")
    end
  end
end