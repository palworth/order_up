Rails.application.routes.draw do
get '/dish/:id', to: 'dishes#show'

get '/chefs/:id', to: 'chefs#show'
end
