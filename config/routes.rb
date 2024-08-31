Rails.application.routes.draw do
  
  devise_for :admin, controllers: {
  sessions: "admin/sessions"
}
  namespace :admin do
    get 'request_comments/index'
  end
  namespace :admin do
    get 'posts/index'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/unsubscribe'
  end
  namespace :admin do
    get 'comments/index'
  end
  namespace :admin do
    get 'book_stores/index'
    get 'book_stores/show'
    get 'book_stores/unsubscribe'
  end
  
  devise_for :book_stores, controllers: {
  registrations: "book_store/registrations",
  sessions: 'book_store/sessions'
}
  namespace :book_store do
    get 'request_comments/index'
  end
  namespace :book_store do
    get 'posts/index'
    get 'posts/new'
  end
  namespace :book_store do
    get 'comments/index'
  end
  namespace :book_store do
    get 'book_stores/edit'
    get 'book_stores/show'
    get 'book_stores/unsubscribe'
  end
  
  devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  get 'homes/about'
  get 'homes/top'
  namespace :public do
    get 'request_comments/new'
  end
  namespace :public do
    get 'posts/index'
    get 'posts/show'
  end
  namespace :public do
    get 'customers/edit'
    get 'customers/show'
    get 'customers/unsubscribe'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
