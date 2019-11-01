class PagesController < ApplicationController
    def team
    end

    def contact
    end

    def home
        @all = Gossip.all
        @all_users = User.all
    end

    def welcome
        @first_name = params['first_name']
    end
end
