Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'admission_letter/index'
    end
  end

  namespace :api do
    namespace :v1 do
      post 'admission_letter/create'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'admission_letter/show'
    end
  end

  namespace :api do
    namespace :v1 do
      put 'admission_letter/update'
    end
  end

  namespace :api do
    namespace :v1 do
      delete 'admission_letter/destroy'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'receipt/index'
    end
  end

  namespace :api do
    namespace :v1 do
      post 'receipt/create'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'receipt/show'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'receipt/update'
    end
  end

  namespace :api do
    namespace :v1 do
      put 'receipt/destroy'
    end
  end

  namespace :api do
    namespace :v1 do
      post 'user_sigin/sigin'
    end
  end

  namespace :api do
    namespace :v1 do
      post 'user_signup/create'
    end
  end

  namespace "api" do
    namespace "v1" do
      post :admins, :admin_sigin
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
