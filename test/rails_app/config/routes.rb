Rails.application.routes.draw do

  scope module: :adminos do
    resource :session, only: [:new, :create, :destroy]
  end

end
