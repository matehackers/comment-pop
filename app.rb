require 'sinatra'
require 'json'

configure do
end

helpers do
end

# before '/secure/*' do
# end

get '/comments/:video' do
    comments = []
    hash = { :video => params[:video], :user => 'lucas', :content => 'lol' }
    comments[0] = hash

    comments.to_json

end
