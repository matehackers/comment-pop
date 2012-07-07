require 'data_mapper'

class Comment
  include DataMapper::Resource

  property :id,             Serial
  property :video_type,     String
  property :commenter,      String
  property :video,          String
  property :content,        String
  property :start_time,     Integer
end
