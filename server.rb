require "webrick"

server = WEBrick::HTTPServer.new({
  :DocumentRoot => './',
  :BindAddress => '0.0.0.0',
  :Port => 8000,
  :CGIInterpreter => '/usr/local/src/rbenv/shims/ruby'
  })
server.mount('/request', WEBrick::HTTPServlet::CGIHandler, './rb/request.rb')
trap("INT"){ server.shutdown }
server.start
