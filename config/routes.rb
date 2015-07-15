SampleApp::Application.routes.draw do

  # http://guides.rubyonrails.org/i18n.html
  scope "/:locale" do
  end

  get '/blogs_:content_type' => 'blogs#index', as: 'blogs_content_type'
  resources :users
  resources :sessions,      only: [:new, :create, :destroy]  
  root 'static_pages#home'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

  get '*unmatched_route', :to => 'static_pages#nil_routes'

  get 'sitemap.xml', to: 'sitemap#index', as: 'sitemap', defaults: { format: 'xml' }

end
