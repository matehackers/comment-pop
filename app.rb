require 'sinatra'
require 'data_mapper'
require 'json'

class Comment
  include DataMapper::Resource

  property :id,             Serial
  property :video_type,     String
  property :commenter,      String
  property :video,          String
  property :content,        String
  property :start_time,     Integer
end

configure do
    DataMapper.setup(:default, "sqlite3::memory:")

    Comment.auto_migrate!
    c = Comment.new
    c.video_type = 'youtube'
    c.commenter = 'lucas'
    c.video = 'yyR_eCAggsA'
    c.content = 'lol'
    c.start_time = 1
    c.save
end

helpers do
end

# get '/'

# end

get '/comments/:video' do
    c = Comment.get(1)
    comments = []

    hash = { :video => params[:video],
             :user => c.commenter, :content => c.content }

    comments[0] = hash

    comments.to_json
end
