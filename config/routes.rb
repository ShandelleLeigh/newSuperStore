Rails.application.routes.draw do
  root 'departments#index'

  resources :departments do
    resources :products
  end

end
