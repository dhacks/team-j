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
      puts "message"
	end

end
