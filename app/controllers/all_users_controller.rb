class AllUsersController < ApplicationController
    def show

        @users = User.all

        respond_to do |format|
            format.html {}
            format.json {
                @users = @users.limit(5)
            }
        end
            
    end

    def convert

        user = User.find(params[:user])

        if user.has_role?(:moderator)
            redirect_to all_users_show_path, alert: "Selected user already has moderator privileges"

        else
            user.add_role 'moderator'
            user.save!
            redirect_to all_users_select_country_path(user: user)

        end
    end

    def unconvert

        user = User.find(params[:user])

        if user.has_role?(:moderator)
            user.remove_role 'moderator'
            user.save!
            redirect_to all_users_show_path, notice: "Changed user's privileges to normal user"

        else
            redirect_to all_users_show_path, alert: "Selected user is already a normal user"

        end
    end

    def select_country

        @user = params[:user]
        @countries = Country.all.order('created_at DESC')

    end

    def assign_country

        id = params[:id]
        user = User.find(params[:user])
        user.country_id = id
        user.save!

        redirect_to  all_users_show_path, notice: "Moderator assigned succesfully"

    end
end