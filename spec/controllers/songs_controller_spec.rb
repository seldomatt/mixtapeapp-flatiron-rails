require 'spec_helper'

describe SongsController do 
  describe 'POST /songs' do 

    it 'should create a song with a name' do 
      post :create, {:song => {:name => "Thriller"}}

      assigns(:song).name.should == "Thriller"
    end

    it 'should create a song with an artist name' do 
      post :create, {:song => {:name => "Thriller", :artist_name => "Michael Jackson"}}

      assigns(:song).artist.name.should == "Michael Jackson"
    end

    it 'should create a song with a genre' do 
      post :create, {:song => {:name => "Thriller", :genre_names => "Pop"}}

      assigns(:song).genres.find_by_name("Pop")
      assigns(:song).genre_names.should include("Pop")
    end
  end
end
