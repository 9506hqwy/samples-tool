# submodule01.just をモジュールとして読み込む。
# 下記のファイルを検索する。
# - submodule01.just
# - submodule01/justfile
# - submodule01/.justfile
# - submodule01/mod.just
mod submodule01

# ./modules/submodule02.just をモジュールとして読み込む。
mod submodule02 "./modules/submodule02.just"

hello-world-module: submodule01::work01
