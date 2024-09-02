Rails.application.routes.draw do
  root :to =>"homes#top"
  get '/about' => 'homes#about'
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    resources :customers, only: [:index, :show, :destroy] do
      member do
        get 'unsubscribe'
        patch 'withdraw'
      end
      collection do
        get 'search'
      end
    end
    resources :comments, only: [:index, :show, :destroy] do
      collection do
        get 'search'
	    end
	  end
	  resources :book_stores, only: [:index, :show, :destroy] do
	    member do
  	    get 'unsubscribe'
        patch 'withdraw'
      end
	    collection do
	      get 'search'
	    end
	  end
	  resources :posts, only: [:index, :destroy] do
	    collection do
	      get 'search'
	    end
	  end
	  resources :request_comments, only: [:index, :destroy] do
	    collection do
	      get 'search'
	    end
	  end
  end
  
  devise_for :book_stores, skip: [:passwords], controllers: {
    registrations: "book_store/registrations",
    sessions: 'book_store/sessions'
  }
  devise_scope :book_store do
    get "book_stores/guest_sign_in", to: "book_store/sessions#guest_sign_in"
  end
  namespace :book_store do
    resources :book_stores, only: [:show, :edit, :update] do
      resources :posts do
        resources :comments, only: [:index]
      end
      resources :tags, only: [:index, :create, :destroy]
      collection do
        get 'unsubscribe'
        patch 'withdraw'
      end
    end
    resources :posts
    resources :request_comments, only: [:index] do
      collection do
        get 'search'
      end
    end
  end
  
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  devise_scope :customer do
    get "customers/guest_sign_in", to: "public/sessions#guest_sign_in"
  end
  namespace :public do
    resources :customers, only: [:show, :edit, :update] do
      collection do
        get 'unsubscribe'
        patch 'withdraw'
      end
    end
    resources :book_stores
    resources :posts, only: [:index, :show] do
      resources :thoughtse_comments, only: [:index, :create, :destroy]
      collection do
        get 'search'
      end
    end
    resources :request_comments, only: [:new, :index, :create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
