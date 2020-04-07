module ChatsHelper
  def choose_index_or_edit
    if action_name == 'index' || action_name == 'create' || action_name == 'confirm'
      confirm_chats_path
    else action_name == 'edit'
      chat_path
    end
  end
end
