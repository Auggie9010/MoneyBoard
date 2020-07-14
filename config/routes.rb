Rails.application.routes.draw do
  get 'report' => 'report#index'
  get 'accounts' => 'accounts#index'
  get 'chart' => 'chart#index'
  get "/" => "home#top"
end
