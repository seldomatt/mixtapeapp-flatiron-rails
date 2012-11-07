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

  context 'with genres' do 
    let(:genre){Genre.create(:name => "Pop")}

    context '.genre_names' do 

      it "should return an array of genre names" do 
        song.add_genre("Pop")
        song.save
        song.genre_names.should be_an_instance_of(Array)
        song.genre_names.should include("Pop")
      end

      it "should accept a comma delimited list of genre names" do 
        song.add_genre("Pop")
        song.add_genre("Techno")
        song.save
        song.genre_names.should include("Pop", "Techno")
      end
    end

    context '.genre_names=' do 

      it "should accept a genre name and add that genre" do 
        song.genre_names=("Techno")
        song.save
        song.genre_names.should include("Techno")
      end

    end

  end

end