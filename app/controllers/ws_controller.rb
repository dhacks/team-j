class WsController < WebsocketRails::BaseController
	
	def initialize_session
    	logger.debug("Session Initialized")
  	end
    
    def connect_user
        logger.debug("connected user")
    end

  	def new_message
	  # messageという変数が送られてくる
      gid = message[:group_id]
      WebsocketRails["#{gid}"].trigger(:new_message, message)
      Chat.create(man_id: message[:man_id], woman_id: message[:woman_id], group_id: gid, message: message[:body], ms_time: "2016-02-26 02:07:53 +0900", own_id: message[:own_id], own_name: message[:own_name])
      logger.debug("create")
      puts "message"
	end

end
