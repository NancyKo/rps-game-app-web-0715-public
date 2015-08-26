require_relative 'config/environment'

class GameApp < Sinatra::Base
  get '/rps/:play' do
    # Your app code goes here
    play = params[:play].to_sym
    @game = RPSGame.new(play)

    erb :rps_game
  end


end
