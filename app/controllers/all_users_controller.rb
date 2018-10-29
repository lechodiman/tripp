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
			redirect_to all_users_show_path, notice: "Selected user already has moderator privileges"

		elsif user.has_role?(:admin)
			redirect_to all_users_show_path, notice: "Selected user is an admin"

		else
			user.add_role 'moderator'
			redirect_to all_users_show_path, notice: "Now this user is a moderator"

		end
	end
end