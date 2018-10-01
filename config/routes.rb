Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :users, except: %i[new edit]
  resources :osras, except: %i[new edit] do
    resources :osra_meetings, except: %i[index new edit]
  end
end
