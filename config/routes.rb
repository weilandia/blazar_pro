Rails.application.routes.draw do
  scope module: 'api', constraints: { format: 'json' } do
    namespace :v1 do
      post '/rfqs_from_email', to: 'rfqs#create_from_email'
    end
  end
end
