require "json"

# リクエスト処理クラス
class requestHandler
	# ------初期化処理------
	# リクエストタイプの定義
	def initialize(type)
		@reqType = type
		@responseHeader = "text/html"		# レスポンスヘッダーを初期化
	end

	# ------各種メソッド定義------
	# レスポンスヘッダーを返す
	def header
		@responseHeader
	end

	# 現在のリクエストタイプを参照
	def type?
		@reqType
	end

	# 資金管理かどうか
	def is_money?
		if @reqType == "money"
			return true
		else
			return false
		end
	end

	# ToDo管理かどうか
	def is_todo?
		if @reqType == "todo"
			return true
		else
			return false
		end
	end

	# 備忘録かどうか
	def is_memo?
		if @reqType == "memo"
			return true
		else
			return false
		end
	end

	# 資金管理データ取得メソッド
	def moneyMod(param)
		# ---共通パラメータ取得---
		uid = param["uid"]	# ID
		# 現在の金額
		SQLite3::execute("SELECT money FROM user WHERE id = #{id}") do |getMoney|
			money = getMoney["money"]
		end

		# ---各種処理---
		case param["mode"]
		# [一覧表示]
		when "dispHistory"
			# 100件まで取得
			query = "SELECT * FROM history where id='#{param['id']}' LIMIT 100"
			if(param["sort"])
			 query << "ORDER BY #{param['sort']}"
			else
			 query << "ORDER BY dt desc"
			end
			# 各データを整形
			SQLite3::execute(query) do |row|
				# getData << { }	# いろいろ作る
			end
		# [収支追加]
		when "addData"
			# カテゴリ取得
			category = param["category"]
			# 金額取得
			reqAmount = param["amount"]
			# 収入か支出か
			SQLite3::execute("SELECT codevalue FROM codemaster WHERE id = '#{uid}' AND category = '#{category}' LINIT 1") do |row|
				getType = row["codevalue"]
			end
			# 現在の金額を更新
			if(getType == "in")	# 収入の場合
				money += reqAmount
			else
				money -= reqAmount
			end
			# データベースへ反映
			SQLite3::execute("UPDATE user SET money = '#{money}' WHERE ID = '#{uid}'")
			SQLite3::execute("INSER INTO history (ID,CATEGORY,DATA,DT) VALUES('#{uid}','#{category}','#{money}','now')")	# 後でテーブルを確定させる
		# [カテゴリ追加]
		when "addCategory"
			# 新カテゴリ取得
			newCategory = param["category"]
			# 収入か支出か
			newCategoryType = param["type"]
			# データベースへ反映
			SQLite3::execute("INSER INTO codemaster (ID,CODEVALUE,CATEGORY,TYPE) VALUES ('#{uid}',)")		# 後でテーブル定義に従ってSQL作る
	end
	# レスポンスのボディを生成
	def makeResponse(data)
		# moduleから返すボディを取得
	end
end
