Rails.application.routes.draw do
  # all user authentication logic, using gem devise
  devise_for :users

  # application related user logic
  get 'user/account', to: 'users#show', as: 'account'
  get 'user/account/edit', to: 'users#edit', as: 'edit_account'
  post 'user/account/update', to:'users#update', as: 'user'

  # show details for specified order
  get 'order/:id', to: 'orders#show', as: 'order'

  resources :items do
    resources :bids
  end

  post 'item/:item_id/image/:image_id/delete/', to: 'items#delete_item_image', as: 'delete_item_image'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => redirect('/items')
end
