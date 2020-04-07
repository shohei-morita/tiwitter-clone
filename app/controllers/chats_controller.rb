class ChatsController < ApplicationController
  before_action :set_chat, only: [:edit, :update, :destroy]
  before_action :order_chats, only: [:index, :create, :confirm]

  def index
    @chat = Chat.new
  end

  def create
    @chat = Chat.new(chat_params)
    if params[:back]
      render :index
    else
      if @chat.save
        redirect_to chats_path, notice: 'つぶやきを投稿しました！'
      else
        render :index
      end
    end
  end

  def show; end

  def edit; end

  def update
    if set_chat.update(chat_params)
      redirect_to chats_path, notice: "つぶやきを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @chat.destroy
    redirect_to chats_path, notice: "つぶやきを削除しました！"
  end

  def confirm
    @chat = Chat.new(chat_params)
    render :index if @chat.invalid?
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
