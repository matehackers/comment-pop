require '../comment'

describe Comment do

    DataMapper.setup(:default, "sqlite3::memory:")

    Comment.auto_migrate!
    c = Comment.new :video_type => 'youtube', :commenter => 'lucas',
                    :video => 'a video id', :content => 'lol', :start_time => 1
    c.save
    c = Comment.new :video_type => 'youtube', :commenter => 'guilherme',
                    :video => 'a video id', :content => 'lola', :start_time => 3
    c.save

    c = Comment.new :video_type => 'youtube', :commenter => 'alan',
                    :video => 'other video', :content => 'lola', :start_time => 3
    c.save

    it 'should find two comments for video "a video id"' do
        Comment.all(:video => 'a video id').size.should == 2
    end

    it 'should find one comment for video "other video"' do
        Comment.all(:video => 'other video').size.should == 1
    end

end