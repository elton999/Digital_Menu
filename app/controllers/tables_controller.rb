class TablesController < ApplicationController
    before_action :authenticate_user!

    def index
        @tables = Table.all
    end
end
