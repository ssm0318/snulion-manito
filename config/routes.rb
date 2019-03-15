Rails.application.routes.draw do
  devise_for :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'posts#index'
  get '/posts/new' => 'posts#new'
  post '/posts' => 'posts#create'
  delete '/posts/:id' => 'posts#destroy'
  post '/posts/:id/comments' => 'posts#create_comment'
  delete '/posts/:id/comments/:comment_id' => 'posts#destroy_comment'
  post '/post_commments/:id' => 'posts#create_reply'

  # https://github.com/plataformatec/devise
end
