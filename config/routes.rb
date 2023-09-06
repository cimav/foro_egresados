Rails.application.routes.draw do

  mount Thredded::Engine => '/forum'

  # Set root to be the Thredded forums index page at /forum.
  root to: 'thredded/messageboards#index'

  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }

  # Let /users/:id route to the profiles controller show action.
  # This is optional, but it allows you to have a link to a user's profile page.
  get '/users/:id' => 'profiles#show'
  get '/users' => 'profiles#index'

  post 'users/profiles/update_curp' => 'profiles#update_curp'
  post 'users/profiles/update_trajectory' => 'profiles#update_trajectory'

end
