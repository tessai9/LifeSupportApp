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

	# レスポンスのボディを生成
	def makeResponse(data)
		# moduleから返すボディを取得
	end
end
