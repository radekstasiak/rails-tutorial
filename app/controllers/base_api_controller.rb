class BaseApiController < ApplicationController

    before_filter :parse_request, :authenticate_token


    def authenticate_token

    end

    def parse_request
    	
    end

end