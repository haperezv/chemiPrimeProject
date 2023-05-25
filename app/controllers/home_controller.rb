class HomeController < ApplicationController
    def index
        redirect_to requests_path
    end
end