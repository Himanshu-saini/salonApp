Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get 'salon' => 'salon#get_salon_detials', :defaults => {:format => 'json'}
      post 'salon' => 'salon#add_salon', :defaults => {:format => 'json'}

    end
  end
end
