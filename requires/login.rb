=begin
*************ログイン処理*************
=end

#require "sqlite3"

#database = SQLite3::Database.new('../data.sqlite3')

class Login
  def find_user(id,pass)
#    sql = "SELECT count(id) FROM users WHERE id='#{id}' AND pass='#{pass}'"
#    existance = database.get_first_value(sql)
#    if existance > 0
    if id=="1"
      p "top.html"
    else
      p "error"
    end
  end
end
