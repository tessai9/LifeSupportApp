require "cgi"

# --------パラメータ取得--------
# リクエストのタイプを取得
# [money,todo,memo]
reqType  = cgiHandle["type"]

# --------変数定義--------
# CGIハンドラの定義
cgiHandle = CGI.new

# モードを基にページ管理クラスの定義
# XX = YY.new(reqType,cgiHandle["data"])

# --------レスポンス処理--------
# ページ管理クラスからヘッダーと、内容を返す
# print XX.header
# print XX.body
