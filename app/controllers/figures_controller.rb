class FiguresController < ApplicationController

  get "/figures/new" do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"figures/new"
  end

  post "/figures" do

    @figure = Figure.find_or_create_by(name: params["figure"]["name"])

    if params["figure"]["title_ids"]
      params["figure"]["title_ids"].each do |id|
        @figure.titles << Title.find(id)
      end
    end

    if params["figure"]["landmark_ids"]
      params["figure"]["landmark_ids"].each do |id|
        @figure.landmarks << Landmark.find(id)
      end
    end

    if params["title"]["name"] != ""
      @figure.titles << Title.find_or_create_by(name: params["title"]["name"])
    end

    if params["landmark"]["name"] != ""
      @figure.landmarks << Landmark.find_or_create_by(name: params["landmark"]["name"])
    end

  end

  get "/figures" do
    @figures = Figure.all
    erb :"figures/index"
  end

  get "/figures/:id" do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end

  get "/figures/:id/edit" do
    @figure = Figure.find(params[:id])
    erb :"figures/edit"
  end

  
  
  
 


end
