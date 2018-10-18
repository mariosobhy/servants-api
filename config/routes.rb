Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :users, except: %i[new edit]

  resources :osras, except: %i[new edit] do
    resources :osra_meetings, except: %i[index new edit]
  end

  resources :bible_studies, except: %i[new edit] do
    resources :bible_study_meetings, except: %i[index new edit]
  end

  resources :courses, except: %i[new edit] do
    resources :course_meetings, except: %i[index new edit]
  end

  resources :conferences, except: %i[new edit]

  resources :spiritual_days, except: %i[new edit]

  resources :events, only: %i[] do
    resources :attendees, only: %i[create destroy]
  end
end
