class @ChatClass
  constructor: (url, useWebsocket) ->
    group_id = $('#group_id').val()
    # これがソケットのディスパッチャー
    @dispatcher = new WebSocketRails(url, useWebsocket)
    @channel = @dispatcher.subscribe(group_id)
    # イベントを監視
    @bindEvents()

  bindEvents: () =>
    # 送信ボタンが押されたらサーバへメッセージを送信
    $('#send').on 'click', @sendMessage
    # サーバーからnew_messageを受け取ったらreceiveMessageを実行
    @dispatcher.bind 'new_message', @receiveMessage
    @channel.bind 'new_message', @receiveMessage

  sendMessage: (event) =>
    # サーバ側にsend_messageのイベントを送信
    # オブジェクトでデータを指定
    user_name = $('#username').val()
    msg_body = $('#msgbody').val()
    group_id = $('#group_id').val()
    man_id = $('#man_id').val()
    woman_id = $('#woman_id').val()
    own_id = $('#own_id').val()
    own_name = $('#own_name').val()
    @dispatcher.trigger 'new_message', { name: user_name , body: msg_body , group_id: group_id, man_id: man_id, woman_id: woman_id, own_id: own_id, own_name: own_name}
    $('#msgbody').val('')

  receiveMessage: (message) =>
    # 受け取ったデータをappend
    alert("recieve")
    $('#chat').append "#{message.name} : #{message.body}<br/>"

$ ->
  window.chatClass = new ChatClass($('#chat').data('uri'), true)