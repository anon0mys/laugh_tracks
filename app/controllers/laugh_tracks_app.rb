class LaughTracksApp < Sinatra::Base

  get '/comedians' do
    erb :'comedians/index', locals: { comedians: Comedian.all }
  end
end
