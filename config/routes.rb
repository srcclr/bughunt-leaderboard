Leaderboard::Engine.routes.draw do
  resources :boards, only: [:index]

  root to: "boards#index"
end
