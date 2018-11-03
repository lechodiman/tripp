class PollsController < ApplicationController
    def index
        @polls = Poll.all
    end

    def new
        @poll = Poll.new
    end

    def create
        @poll = Poll.new(poll_params)
        if @poll.save
            flash[:success] = 'Poll was created!'
            redirect_to polls_path
        else
            render 'new'
        end
    end

    private

    def poll_params
        params.require(:poll).permit(:topic)
    end
end
