Crowdblog::Application.routes.draw do

  mount RedactorRails::Engine => '/redactor_rails'

  devise_for :users, controllers: { omniauth_callbacks: 'crowdint_auth/omniauth_callbacks' }

  devise_scope :user do
    match 'google_apps_sign_in', to: 'crowdint_auth/omniauth_callbacks#google_apps_sign_in'
  end

  namespace :admin do
    resource :dropbox_authorization
    resource :dropbox_sync

    resources :authors, :only => [:index, :update]
    resources :categories
    resources :esnoticia
    resources :banners
    resources :portadas do
      member do
        delete '/:section_id/:post_id/', to: 'portadas#delete_post', as: 'delete_post'
        get '/:type/:search', to: 'portadas#search_post', as: 'search_post'
      end
      get :clone_portada, :on => :collection
      get :transition, :on => :collection
    end

  end
  match 'admin/posts/:id/related/:related_id', to: 'crowdblog/admin/posts#delete_related', via: :delete,
      as: 'delete_related_post'

  namespace :crowdblog do
    resources :posts do
      get :autocomplete_title, :on => :collection
      get :quick_view, :on => :collection
    end
  end
  # match '/posts/autocomplete_title', to: 'crowdblog/posts#autocomplete_title', via: :get

  match '/:year/:month/:day/:id(.:format)', to: 'crowdblog/posts#show', as: 'post',
      constraints: { year: /\d+/ }

  match '/preview/:id', to: 'previews#show', constraints: { id: /\d+/ }, as: 'preview'

  match '/seccion/:name', to: 'crowdblog/categories#show', as: 'seccion'
  match '/esnoticia/:name', to: 'crowdblog/esnoticia#show', as: 'esnoticia'
  match '/search', to: 'crowdblog/searches#show', as: 'searches'

  match '/archive', to: 'archive#show', as: 'archive'

  match '/atom.(:format)', to: 'feeds/atom_feeds#show', as: 'atom_feed'

  match '/static/:page', to: 'statics#show', as: 'statics'
  root to: "portadas#show"
  mount Crowdblog::Engine => '/'


  match 'sitemap.(:format)', to: 'sitemap#show'
  match '/author/:id', to: 'posts_by_author#index', as: 'posts_by_author'


end
