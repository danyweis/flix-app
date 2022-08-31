require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the MoviesHelper. For example:
#
# describe MovieHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

# RSpec.describe MovieHelper, type: :helper do => got error because of MovieHelper and not MoviesHelper
RSpec.describe MoviesHelper, type: :helper do

  it 'returns Flop! if movie total_gross <= 225_000_000' do 
    movie = Movie.create(total_gross: 225_000_000)

    expect(total_gross(movie)).to eq "Flop!"
  end

  it 'returns total_gross if movie total_gross > 225_000_000' do 
    movie = Movie.create(total_gross: 225_000_001)

    expect(total_gross(movie)).to eq "$225,000,001"
  end

  it 'returns the year the movie was released' do 
    movie = Movie.create(released_on: "2016-08-30")

    expect(year_of(movie)).to eq "2016"
  end



end
