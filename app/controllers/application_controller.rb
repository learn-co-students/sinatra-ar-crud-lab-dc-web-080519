
require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    
  end

  get '/articles/new' do
    erb :new
  end

  

  post '/articles' do
    @title = params[:title]
    @content = params[:content]

    @article = Article.create(title: @title, content: @content)
    # binding.pry
    redirect "/articles/#{@article.id}"

  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    id = params[:id]
    @article = Article.find(id)
    erb :show
  end

  get '/articles/:id/edit' do
    id = params[:id]
    @article = Article.find(id)
    erb :edit
  end

  patch '/articles/:id' do
    id = params[:id]
    @article = Article.find(id)
    @article.update(title: params[:title])
    @article.update(content: params[:content])
    redirect "/articles/#{@article.id}"
  end

  delete '/articles/:id' do
    id = params[:id]
    @article = Article.find(id)
    @article.destroy
    redirect '/articles'
  end

end


      # Create Action
# creates a new article (FAILED - 1)
# redirects to '/articles/:id' (FAILED - 2)
      # Read Action
          # index action
#   responds with a 200 status code (FAILED - 3)
#   displays all the articles (FAILED - 4)
          #   show action
#   show page responds with a 200 status code (FAILED - 5)
#   show page displays the article's title
#   show page displays the article's content (FAILED - 6)
      # update action
# responds with a 200 status code (FAILED - 7)
# displays the existing object in the edit form (FAILED - 8)
# saves edits to an article (FAILED - 9)
# redirects to '/articles/:id' (FAILED - 10)
# submits the form via a patch request (FAILED - 11)
      # delete action
# responds with a 200 status code (FAILED - 12)
# deletes an article from the database (FAILED - 13)
# submits the form via a delete request (FAILED - 14)