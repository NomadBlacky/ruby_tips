# ロードパス

require でロードするときに検索対象になるディレクトリ

```ruby

# スクリプト上で設定
$LOAD_PATH.unshift("/path/to/dir")

```


```ruby

# $LOAD_PATHの別名
$:.unshift("path/to/dir")

```

```sh

# コマンドラインから設定
ruby -I /path/to/dir

```
