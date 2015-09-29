Rails.application.routes.draw do
  root             'static_pages#home'
  get 'contact' => 'static_pages#contact'
end
