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
    # topページへリダイレクトさせる
    redirect_to '/top'

  end

  private
  # ストロングパラメータでコントローラから受け取る
  def list_params
    params.require(:list).permit(:title, :body)
  end

end
