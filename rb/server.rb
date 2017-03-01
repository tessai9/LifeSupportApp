require "webrick"
#require "uri"
#require "./switch.rb"

class ServletAction < WEBrick::HTTPServlet::AbstractServlet
    def do_POST (req, res)
      do_GET(req, res)
    end
end

server = WEBrick::HTTPServer.new({
    :DocumentRoot => '../',
    :BindAddress => '127.0.0.1',
    :Port => '8000'
  })
=begin
server.mount_proc('/rb'){|req,res|
  res.content_type = "text/plain"
  res.body = req.body
}
=end
trap("INT"){ server.shutdown }
server.start
