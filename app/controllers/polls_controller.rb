class PollsController < ApplicationController
    before_action :find_poll, only: [:edit, :update, :destroy]
    before_action :authenticate_user!, only: [:new, :edit]

    def index
        @polls = Poll.all
                     .paginate(page: params[:page], per_page: 2)
    end

    def new
        @poll = Poll.new
    end

    def create
        @poll = Poll.new(poll_params)
        @poll.user_id = current_user.id

        if @poll.save
            flash[:success] = 'Poll was created!'
            redirect_to polls_path
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @poll.update(poll_params)
            flash[:success] = 'Poll was updated!'
            redirect_to polls_path
        else
            render 'edit'
        end
    end

    def destroy
        if @poll.destroy
            flash[:success] = 'Poll was destroyed!'
        else
            flash[:danger] = 'Error destroying poll'
        end
        redirect_to polls_path
    end

    private

    def poll_params
        params.require(:poll)
              .permit(:topic, vote_options_attributes: [:id, :title, :_destroy])
    end

    def find_poll
        @poll = Poll.find(params[:id])
    end
end
