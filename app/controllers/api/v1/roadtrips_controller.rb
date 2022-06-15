class Api::V1::RoadtripsController < ApplicationController
    def create
        if params[:origin] && params[:destination] && params[:api_key]
            trip_info = RoadtripFacade.build_roadtrip(params[:origin], params[:destination])
            if trip_info.nil?
                render json: {error: 'impossible route'}
            else
                render json: RoadtripSerializer.new(trip_info)
            end
        else
            render json: {status: :unauthorized}
        end
    end
end
