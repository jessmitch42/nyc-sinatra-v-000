class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all

    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks' do
    # binding.pry
    lm = Landmark.create(params[:landmark])

    redirect "/landmarks/#{lm.id}"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])

    erb :'landmarks/edit'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    # binding.pry

    erb :'landmarks/show'
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    # binding.pry
    @landmark.update(params[:landmark])

    redirect "/landmarks/#{@landmark.id}"
  end

end
