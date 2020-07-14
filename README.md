# アプリ名称
MoneyBoard(マネーボード)

# アプリ概要
日々の生活の支出/収入を記録して一覧で見ることのできる家計簿アプリ。

# 画面定義
[MoneyBoard画面定義書](https://docs.google.com/spreadsheets/d/1LevZQ0FKoqXFhWVbLXtptEVuiGKAOIe5ULjTSMDxYiI/edit?usp=sharing)

# 進捗状況

| 画面         | 進捗 |
|--------------|------|
| ログイン画面 | 0%   |
| トップページ | 50%  |
| 費目設定     | 0%   |
| レポート     | 50%  |
| 推移         | 0%   |



# こだわりポイント
MoneyForwardやZaimなどの家計簿アプリでは、費目の階層を2階層までしか定義できないため、家計を把握する切り口が限られていた。
MoneyBoardは費目のテーブル:itemsを自己参照させているため、好きな階層まで費目を定義可能である。
そのため、例えば支出>固定費>住居費>住宅ローン費用という具合に深い階層を定義して、好きな粒度で家計を管理する事ができる。

# 使用技術
Ruby 2.6.5
Rails 6.0.3.1
psql (PostgreSQL) 12.3

# テーブル定義

* entries

入出金を記録するテーブル

| # | カラム名      | カラム名(日本語) | 型      | Key      | 内容                               |
|---|---------------|------------------|---------|----------|------------------------------------|
| 1 | id            | ID               | int     | 主キー   | レコードを一位に識別する           |
| 2 | item_id       | 費目コード       | string  | 外部キー | 費目コードを入力する               |
| 3 | is_calculated | 計算対象         | boolean |          | チェックがONだと、計算対象に含める |
| 4 | entry_date    | 日付             | date    |          | 入力日                             |
| 5 | price         | 金額             | decimal |          | 支出/収入の金額                    |
| 6 | content       | 内容             | string  |          | 取引の内容                         |
| 7 | memo          | メモ             | text    |          | メモ                               |
| 8 | created_at    | 登録日           | date    |          | 登録日                             |


* items

収入/支出/生活費/給与などの費目を管理するテーブル
費目にはグループ費目と通常費目の２種類がある
item_group_idで自己参照している

| # | カラム名      | カラム名(日本語)     | 型      | Key      | 内容                                                   |
|---|---------------|----------------------|---------|----------|--------------------------------------------------------|
| 1 | id            | 費目コード           | string  | 主キー   | 費目コードを入力する                                   |
| 2 | item_group_id | 費目分類コード       | string  | 外部キー | 費目分類コード(親階層の費目コード)を入力する           |
| 3 | hierarchy     | 費目階層             | integer |          | 費目の階層を定義                                       |
| 4 | item_name     | 費目名称             | string  |          | 費目名称を入力する                                     |
| 5 | is_group_code | 費目分類コードフラグ | boolean |          | 費目分類コードならチェックあり。予算が入力不可となる。 |
| 6 | budget        | 予算金額             | decimal |          | 費目ごとの月当たりの予算。通常費目にのみ設定する。     |
| 7 | created_at    | 登録日               | date    |          | 登録日                                                 |


[MoneyBoardテーブル項目定義書](https://docs.google.com/spreadsheets/d/12t1XADMNuckSg-yBFQu2-kHHEmlFmzH51uZEXw3QFqA/edit?usp=sharing)
