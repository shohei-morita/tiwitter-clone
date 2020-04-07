class ChatsController < ApplicationController
  before_action :set_chatter, only: [:edit, :update, :destroy]
  before_action :order_chatters, only: [:index, :create, :confirm]

  def index
    @chat = Chat.new
  end

  def create
    @chat = Chat.new(chat_params)
    if params[:bacl]
      render :index
    else
      if @chat.save
        redirect_to chats_path, notice: 'つぶやきを投稿しました！'
      else
        render :index
      end
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:title, :content)
  end

  def set_chat
    @chat = Chat.find(params[:id])
  end

  def order_chats
    @chats = Chat.order(id: :DESC)
  end

end
