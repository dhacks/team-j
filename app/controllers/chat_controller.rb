class ChatController < ApplicationController

def chat
    @man_id = params[:man_id]
    @woman_id = params[:woman_id]
    @messages = Chat.where('man_id = :man_id', man_id: @man_id).where('woman_id = :woman_id', woman_id: @woman_id)
    @man_name = User.find(@man_id).name
    @woman_name = User.find(@woman_id).name
    if @messages[0] == nil then
        puts("maximum",Chat.maximum('group_id'))
        @new_id = Chat.maximum('group_id') + 1
        puts(@new_id)
        @group_id = @new_id
    else
        @group_id = @messages[0].group_id
    end
    
end

#require DateTime
def create
    Chat.create(man_id: chat_params[:man_id], woman_id: chat_params[:woman_id], group_id: chat_params[:group_id], message: chat_params[:message], ms_time: DateTime.now())
end


end
