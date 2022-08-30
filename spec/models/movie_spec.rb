require 'rails_helper'

RSpec.describe Movie, type: :model do

  it 'returns true if total_gross < 225_000_000' do
    movie = Movie.create(total_gross: 2_000_000)

    expect(movie.flop?).to be_truthy
  end
  
  it 'returns true if total_gross = 225_000_000' do
    movie = Movie.create(total_gross: 225_000_000)

    expect(movie.flop?).to be_truthy
  end

  it 'returns true if total_gross is blank' do
    movie = Movie.create()

    expect(movie.flop?).to be_truthy
  end

  it 'returns false if total_gross > 225_000_000' do
    movie = Movie.create(total_gross: 225_000_001)

    expect(movie.flop?).to be_falsey
  end
  
end
