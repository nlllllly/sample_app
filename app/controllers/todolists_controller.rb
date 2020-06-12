class TodolistsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @list = List.new
  end

  def create
    # ストロングパラメータを使用して、安全な方式で外部からアクセスされない下の「private」の「list_params」を実行する。
    list = List.new(list_params)
    # dbへ保存
    list.save
    # 作成した内容の詳細ページへリダイレクトさせる
    redirect_to todolist_path(list.id)
  end

  def index
    # 「index.html.erb」にリストの全てを表示する（全てなのでListsになっている）
    @lists = List.all
  end

  def show
    #findメソッドを使って、「id」を取得する
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end

  private
  # ストロングパラメータでコントローラから受け取る
  def list_params
    params.require(:list).permit(:title, :body)
  end

end
