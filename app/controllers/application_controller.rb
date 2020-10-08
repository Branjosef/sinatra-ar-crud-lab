
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do   #DONE_WORKS
  redirect to "/articles"
  end

  ##Index action  #DONE_WORKS
  get '/articles' do 
  @articles = Article.all 
  erb :index
  end


  ##Create actions  #DONE WORKS
  get '/articles/new' do 
  erb :new
  end
  
  post '/articles' do #DONE WORKS
   @article = Article.create(params)
   redirect to "/articles/#{@article.id}"
  end

   ##Read action - single article  ##DONE WORKS
   get '/articles/:id' do
   @article = Article.find_by_id(params[:id])
   erb :show
   end

   ##EDIT actions  ##DONE WORKS
   get '/articles/:id/edit' do 
    @article = Article.find_by_id(params[:id])
    erb :edit
   end

   patch '/articles/:id' do   #DONE WORKS
    #binding.pry
    @article=Article.find_by_id(params[:id])
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save
    redirect to "/articles/#{@article.id}"
   end

    ##DELETE ActiON
   delete '/articles/:id' do 
    Article.destroy(params[:id])
     redirect to '/articles'
    end

end
