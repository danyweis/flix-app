require 'rails_helper'

RSpec.describe "Movies", type: :request do

  before(:each) do
    @movie = Movie.create( title: "Avengers: Endgame", rating: "PG-13", total_gross: 225_000_000, 
                          description: "After the devastating events of Avengers: Infinity War, the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to undo Thanos' actions and restore order to the universe.", 
                          released_on: "2019-04-26", director: "Anthony Russo", duration: "181 min", image_file_name: "avengers-end-game.png")
  end

  describe "GET /index" do
    it "returns renders index template" do
      get '/'
      expect(response).to render_template(:index)
    end
  end

  describe "GET /show" do
    it "returns renders show template" do
      get '/movies/1'
      expect(response).to render_template(:show)
    end
  end

  describe "GET /edit" do
    it "returns renders edit template" do
      get '/movies/1/edit'
      expect(response).to render_template(:edit)
    end
  end

  describe "GET /new" do
    it "returns renders new template" do
      get '/movies/new'
      expect(response).to render_template(:new)
    end
  end

end
