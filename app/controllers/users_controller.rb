class UsersController < ApplicationController
    decorates_assigned :users

    def index
      @users = User.all
    end
end

  