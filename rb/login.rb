# ログイン処理
#require "sqlite3"
require "net/http"
require "cgi"

#database = SQLite3::DataBase.new('data.rb')

request = CGI.new
uid = request['id']
upass = request['pass']

if uid == "1" && upass == "1"
  #request.out("text/plain"){"mypage.html"}
  puts "mypage.html"
else
  #request.out("text/plain"){"mypage.html"}
  puts "mypage.html"
end
