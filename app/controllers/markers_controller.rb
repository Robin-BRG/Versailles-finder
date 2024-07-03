class MarkersController < ApplicationController
    def index
        @markers = Marker.all
        @pins = @markers.geocoded.map do |marker|
            {
                lat: marker.latitude,
                lng: marker.longitude
            }
        end
    end
end
