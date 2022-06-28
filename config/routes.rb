Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get 'salon' => 'salon#get_salon_detials', :defaults => {:format => 'json'}
      post 'salon' => 'salon#add_salon', :defaults => {:format => 'json'}

      get 'salon/services' => 'service#get_salon_services', :defaults => {:format => 'json'}
      post 'salon/service' => 'service#add_salon_service', :defaults => {:format => 'json'}

      post 'salon/service/book' => 'service#book_service', :defaults => {:format => 'json'}
      post 'salon/service/cancel' => 'service#cancel_service', :defaults => {:format => 'json'}
      get 'salon/service/report' => 'service#get_services_report', :defaults => {:format => 'json'}

    end
  end
end
