require 'spec_helper'

describe Song do

  let(:song){Song.create(:name => "Thriller")} 

  context '.artist_name' do 
    it "should have an artist_name method" do 
      song.should respond_to(:artist_name)
    end

    it "should return a songs artist name" do 
      song.artist = Artist.create(:name => "Michael Jackson")
      song.artist_name.should == "Michael Jackson"
    end
  end

  context '.artist_name=' do 

    it 'should assign the artist via the name' do 
      song.artist_name = "Michael Jackson"
      song.artist.should be_a(Artist)
      song.artist_name.should == "Michael Jackson"
    end

  end

end