Rails.application.routes.draw do

  get "/blog_posts/new" , to: "blog_posts#new", as: :new_blog_post

  get "/blog_posts/:id", to: "blog_posts#show", as: :blog_post

  post "/blog_posts" , to: "blog_posts#create" , as: :blog_posts

  
  # Corrigindo nome do controller
  root "blog_posts#index"  # Corrigindo nome do controller
end
