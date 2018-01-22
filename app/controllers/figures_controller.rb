class FiguresController < ApplicationController

    # **** ENTRY LIST *****
    get '/figures' do
        @figs = Figure.all

        erb :'figures/list'
    end

    # **** CREATE NEW POST *****

    get '/figures/new' do
      @landmarks = Landmark.all
      @titles = Title.all

      erb :'figures/new'
    end

    post '/figures' do
      fig = Figure.create(params[:figure])
      # binding.pry

      if !params[:landmark].empty?
        fig.landmarks << Landmark.create(params[:landmark])
      end
      if !params[:title].empty?
        fig.titles << Title.create(params[:title])
      end
      fig.save

      redirect "/figures/#{fig.id}"
    end

    # **** SINGLE POST *****

    get '/figures/:id' do
      @fig = Figure.find_by_id(params[:id])

      erb :'figures/show'
    end

    # **** EDIT *****

    get '/figures/:id/edit' do
      @fig = Figure.find_by_id(params[:id])

      erb :'figures/edit'
    end

    post '/figures/:id/edit' do
      @fig = Figure.find_by_id(params[:id])
      @fig.update(params[:figure])

      if !params[:landmark].empty?
        @fig.landmarks << Landmark.create(params[:landmark])
      end
      if !params[:title].empty?
        @fig.titles << Title.create(params[:title])
      end

      @fig.save

      redirect "/figures/#{@fig.id}"
    end

end
