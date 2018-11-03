class AllUsersController < ApplicationController
   	def show

   		type = params[:type]
   		@users = User.ransack(name_cont: params[:q]).result(distinct: true)

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
			redirect_to all_users_show_path, notice: "Now this user is a moderator"

		end
	end

	def unconvert

		user = User.find(params[:user])

		if user.has_role?(:moderator)
			user.remove_role 'moderator'
			redirect_to all_users_show_path, notice: "Changed user's privileges to normal user"

		else
			redirect_to all_users_show_path, alert: "Selected user is already a normal user"

		end
	end
end