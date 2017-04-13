require "json"

# リクエスト処理クラス
class reqHandler
	# ------初期化処理------
	# リクエストタイプの定義
	def initialize(type)
		@reqType = type
	end

	# ------各種メソッド定義------
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
end
