SampleApp::Application.routes.draw do

  resources :partners

  resources :newsletters

  # http://guides.rubyonrails.org/i18n.html
  scope "/:locale" do
  end

  get '/blogs_:content_type' => 'blogs#index', as: 'blogs_content_type'
  resources :users
  resources :sessions,      only: [:new, :create, :destroy]
  resources :blogs
  root 'static_pages#home'
  match '/privacy_and_security', to: 'static_pages#privacy_and_security', via: 'get'
  match '/terms_of_use', to: 'static_pages#terms_of_use', via: 'get'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  #match '/help',    to: 'static_pages#help',    via: 'get'
  #match '/about',   to: 'static_pages#about',   via: 'get'
  #match '/contact', to: 'static_pages#contact', via: 'get'

  get '*unmatched_route', :to => 'static_pages#nil_routes'


  get 'sitemap.xml', to: 'sitemap#index', as: 'sitemap', defaults: { format: 'xml' }

end
