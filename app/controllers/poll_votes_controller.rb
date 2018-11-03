class PollVotesController < ApplicationController
    def create
        puts "HOLAAAAZAAAA"

        if current_user && params[:poll] && params[:poll][:id] && params[:vote_option] && params[:vote_option][:id]
            @poll = Poll.find(params[:poll][:id])
            @option = @poll.vote_options.find(params[:vote_option][:id])
    
            if @option && @poll && !current_user.voted_for?(@poll)
                @option.poll_votes.create({user_id: current_user.id})
            else
                render js: 'alert(\'Your vote cannot be saved. Have you already voted?\');'
            end
        else
            render js: 'alert(\'Your vote cannot be saved\');'
        end
    end
end
