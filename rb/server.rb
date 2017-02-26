require "webrick"
#require "uri"
require "./switch.rb"

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
server.mount_proc('/rb'){|req,res|
  #reqs = req
  #res.body = Switch.show_page(req)
  res.body = req.to_s
}
trap("INT"){ server.shutdown }
server.start
