Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :users, except: %i[new edit] do 
    collection do 
      post :import
      get :export
    end 
  end 
  resources :churches, except: %i[new edit] do 
    collection do 
      post :import
      get :export
    end 
  end 

  resources :osras, except: %i[new edit] do
    resources :osra_meetings, except: %i[new edit] do 
      collection do 
        post :import
        get :export
      end 
    end 
    resources :classrooms do 
      collection do 
        post :import
        get :export
      end 
    end 
    collection do 
      post :import
      get :export
    end 
  end

  resources :bible_studies, except: %i[new edit] do
    resources :bible_study_meetings, except: %i[new edit] do 
      collection do 
        post :import
        get :export
      end 
    end 
    collection do 
      post :import
      get :export
    end 
  end

  resources :courses, except: %i[new edit] do
    resources :lectures, except: %i[new edit] do 
      collection do 
        post :import
        get :export
      end 
    end 
    resources :course_meetings, except: %i[new edit] do 
      collection do 
        post :import
        get :export
      end 
    end 
    collection do 
      post :import
      get :export
    end 
  end

  resources :conferences, except: %i[new edit] do 
    collection do 
      post :import
      get :export
    end 
  end 

  resources :spiritual_days, except: %i[new edit] do 
    collection do 
      post :import
      get :export
    end 
  end 

  resources :events, only: %i[] do
    resources :attendees, only: %i[create destroy] do 
      collection do 
        post :import
        get :export
      end 
    end 
    collection do 
      post :import
      get :export
    end 
  end
  resources :birthday_reports, only: :index do 
    collection do 
      post :import
      get :export
    end 
  end 
end
