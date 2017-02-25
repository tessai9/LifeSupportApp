# ログイン処理
#require "sqlite3"
require "net/http"
#require "cgi"

#database = SQLite3::DataBase.new('data.rb')

class Login
  def find_user(id,pass)
    if id == "1" && pass == "1"
      request.out("text/plain"){"mypage.html"}
    else
      request.out("text/plain"){"mypage.html"}
    end
  end
end
