class HomeController < ApplicationController
    def index
        redirect_to requests_index_path
    end
end