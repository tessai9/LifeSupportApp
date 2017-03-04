=begin
*************ページ切り替えクラス*************
=end

# 自作クラスファイルの読み込み
require_files =  Dir.glob("../requires/*.rb")
require_files.each do |fname|
  require fname
end

class SwitchPage

  private
  @DEF_TARGETS = [
    "login",
    "money",
    "memo",
    "todo"
  ]

  public
  def check_target(target)
    return @DEF_TARGETS.include?(target)
  end

  def show_page(request_data)
    if check_target(request_data["target"])
      case target
      when "login"
        Login.find_user(request_data.query["id"], request_data.query["pass"])
      when "money"
        Money.display_page(request_data.query["id"])
      when "memo"
        Memo.display_page(request_data.query["id"])
      when "todo"
        TodoList.display_page(request_data.query["id"])
      end
    else
      DisplayErr.not_found
    end
  end
end
