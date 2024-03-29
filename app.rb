require 'sinatra'
require 'json'

# our models
require './comment'

configure do

    enable :static
    # set :public_folder, File.dirname(__FILE__) + '/static'

    DataMapper.setup(:default, "sqlite3::memory:")

    Comment.auto_migrate!

    c = Comment.new :video_type => 'youtube', :commenter => 'lucas',
                    :video => 'avideoid', :content => 'lol', :start_time => 1
    c.save
    c = Comment.new :video_type => 'youtube', :commenter => 'guilherme',
                    :video => 'avideoid', :content => 'lola', :start_time => 3
    c.save

    c = Comment.new :video_type => 'youtube', :commenter => 'alan',
                    :video => 'othervideo', :content => 'lola', :start_time => 3
    c.save

end

helpers do
end

get '/' do
    haml :main
end

post 'comment' do
    @video = params[:video]
end

get '/comments/:video' do
    c = Comment.all(:video => params[:video])
    c.to_json
end
