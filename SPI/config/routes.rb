Rails.application.routes.draw do



  

  resources :atributosacumulados
  resources :atributosdiarios
  resources :indicadoresacumulados
  resources :indicadoresdiarios
  resources :respuesta
  resources :encuesta
  resources :motivos
  resources :pregunta
  resources :pagos
  resources :mdps
  resources :lineas
  resources :contratos
  resources :fijomovils
  resources :segmentos
  resources :clientes
  get '/historico/index' => 'historico#index', as: 'historico'
  get '/graficos/index' => 'graficos#index', as: 'graficos'
  get '/configuraciones/index' => 'configuraciones#index', as: 'configuraciones'
  get '/ponderacions/index' => 'ponderacions#index', as: 'ponderaciones'
  resources :ponderacions
  devise_for :users
  resources :payments
  resources	:vista2
  root 'vista2#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    authenticated :user do
      root :to => 'vista2#index'
    end

    unauthenticated :user do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
      #'devise/sessions#new'
    end

	end
end
