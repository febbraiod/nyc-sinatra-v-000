require 'spec_helper'

describe "Landmark" do
  before do 
    @figure = Figure.create(:name => "Fiorello LaGuardia") 

    @airport =  Landmark.create(:name => "LG Airport", :year_completed => "1950")
    #As one of the examples in the lesson is "50 B.C.", I have to assume that the year complete is meant to be a string, not an integer.
    @library = Landmark.create(:name => "Library")
    
  end

  it "has a name and a year_completed" do 
    expect(@airport.name).to eq("LG Airport")
    expect(@airport.year_completed).to eq("1950")
  end

  it "belongs to a figure" do 
    @figure.landmarks << @airport
    expect(@airport.figure).to eq(@figure)
  end
end
