require 'rails_helper'

RSpec.describe Movie, type: :model do

  before(:each) do
    @movie = Movie.create( title: "Avengers: Endgame", rating: "PG-13", total_gross: 225_000_000, 
                          description: "After the devastating events of Avengers: Infinity War, the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to undo Thanos' actions and restore order to the universe.", 
                          released_on: "2019-04-26", director: "Anthony Russo", duration: "181 min", image_file_name: "avengers-end-game.png")
  end 

  # Creation of a movie
  describe 'creation of a movie' do
    it 'should have created one move after Movie.create' do
      expect(Movie.all.count).to eq(1)
    end
  end

  # Validations
  it 'should not let create a movie when title not present' do
    @movie.title = nil
    expect(@movie).to_not be_valid
  end
  
  it 'should not let create a movie when released_on not present' do
    @movie.released_on = nil
    expect(@movie).to_not be_valid
  end
  
  it 'should not let create a movie when duration not present' do
    @movie.duration = nil
    expect(@movie).to_not be_valid
  end
  
  it 'should not let create a movie when description has less than 25 characters' do
    @movie.description = "less than 25 characters!" #24 characters
    expect(@movie).to_not be_valid
  end

  it 'should not let create a movie when total_gross is less than 0' do
    @movie.total_gross = -1
    expect(@movie).to_not be_valid
  end

  it 'should not let create a movie when image_file_name format is not .jpg or .png' do
    @movie.image_file_name = "test.mov"
    expect(@movie).to_not be_valid
  end

  it 'should create a movie when image_file_name format is .jpg' do
    @movie.image_file_name = "test.jpg"
    expect(@movie).to be_valid
  end

  it 'should let create a movie when image_file_name format is .png' do
    expect(@movie).to be_valid
  end
  
  #methodes

  it 'checks if released_on is after today, if true movie will not be shown'

  it 'returns true if total_gross = 225_000_000' do
    expect(@movie.flop?).to be_truthy
  end

  it 'returns true if total_gross < 225_000_000' do
    @movie.total_gross = 2_000_000
    expect(@movie.flop?).to be_truthy
  end
  
  it 'returns true if total_gross is blank' do
    @movie.total_gross = nil
    expect(@movie.flop?).to be_truthy
  end

  it 'returns false if total_gross > 225_000_000' do
    @movie.total_gross = 225_000_001
    expect(@movie.flop?).to be_falsey
  end
  
end
