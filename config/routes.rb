Rails.application.routes.draw do
  devise_for :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'posts#index', as: :posts
  get '/posts/new' => 'posts#new', as: :new_post
  post '/' => 'posts#create', as: :create_post
  delete '/posts/:id' => 'posts#destroy'
  post '/posts/:id/comments' => 'posts#create_comment'
  delete '/posts/:id/comments/:comment_id' => 'posts#destroy_comment'
  post '/post_commments/:id' => 'posts#create_reply'
  get '/posts/admin' => 'posts#admin'
  get '/posts/guess' => 'posts#guess'
  post '/posts/guess' => 'posts#match'
  get '/results' => 'posts#results'

  # https://github.com/plataformatec/devise
  # https://github.com/njs03332/snulion6th/blob/master/app/views/feeds/index.html.erb
  # https://github.com/carrierwaveuploader/carrierwave
end
