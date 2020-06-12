Rails.application.routes.draw do
  get 'todolists/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # ブラウザで「localhost:3000/top」とアクセスしてきたら、ビューのhomesディレクトリ内の「top.html.erb」にルーティングする。
  # 厳密には、「homes_controller.rb」の「top」アクションをゲット。
  get 'top' => 'homes#top'

  #「localhost:3000/todolists」にリクエストしたときに、「todolists_controller.rb」内の「create」アクションを呼び出す。
  post 'todolists' => 'todolists#create'

  # 「localhost:3000/todolists」にアクセスしたら、「index.html.erb」にルーティングする。
  get 'todolists' => 'todolists#index'

  # 「localhost:3000/5」とかにアクセスしたら、「todolists」の「show」アクションにルーティングして、id で判別して「show.html.erb」にルーティングする。
  get 'todolists/:id' => 'todolists#show', as: 'todolist'

  get 'todolists/:id/edit' => 'todolists#edit', as: 'edit_todolist'

  patch 'todolists/:id' => 'todolists#update', as: 'update_todolist'
  
end
