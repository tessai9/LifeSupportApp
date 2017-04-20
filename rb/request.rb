require "cgi"
require "./requestHandler.rb"

# --------変数定義--------
# CGIハンドラの定義
cgiHandle = CGI.new


# --------パラメータ処理--------
# リクエストのタイプを取得
# [money,todo,memo]
reqType  = cgiHandle["type"]

# リクエストタイプを基にページ管理クラスの定義
reqHandle = requestHandler.new(reqType)

# レスポンスを取得
resbody = requestHandler.makeResponse(cgiHandle["data"])

# --------レスポンス処理--------
# ページ管理クラスからヘッダーと、内容を返す
print cgiHandle.header(requestHandler.header)
print resbody
