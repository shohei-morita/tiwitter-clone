class ChatsController < ApplicationController
  before_action :set_chat, only: [:edit, :update, :destroy]
  before_action :chats_order, only: [:index, :create, :update, :confirm]

  def index
    @chat = Chat.new
  end

  def info; end

  def create
    @chat = Chat.new(chat_params)
    if params[:back]
      render :index
    else
      if @chat.save
        redirect_to chats_path, notice: 'しゃべりました！'
      else
        render :index
      end
    end
  end

  def edit; end

  def update
    if params[:back]
      redirect_to chats_path
    else
      if set_chat.update(chat_params)
        redirect_to chats_path, notice: "しゃべりなおしました！"
      else
        render :edit
      end
    end
  end

  def destroy
    @chat.destroy
    redirect_to chats_path, notice: "発言を取り消しました"
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

  def chats_order
    @chats = Chat.order(id: :DESC)
  end

end
