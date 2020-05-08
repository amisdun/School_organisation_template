Rails.application.routes.draw do
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
