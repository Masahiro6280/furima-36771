# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false              |
| nickname           | string | null: false              |
| first_name         | string | null: false              | 
| last_name          | string | null: false              |
| first_name_huri    | string | null: false              |
| last_name_huri     | string | null: false              |
| birthday           | date   | null: false              |

### Association

* has_many :items
* has_many :orders


## items テーブル



| Column           | Type           | Options                       |
| ---------------- | -------------- | ------------------------------|
| item_name        | string         | null: false                   |
| title            | text           | null: false                   |
| delivery_fee_id  | integer        | null: false                   |
| category_id      | integer        | null: false                   |
| status_id        | integer        | null: false                   |
| area_id          | integer        | null: false                   |
| period_id        | integer        | null: false                   |
| place            | integer        | null: false                   |
| user             | references     | null: false,foreign_key: true |

### Association

* has_one :order
* belongs_to :user


## addresses テーブル
| Column           | Type           | Options                        |
|------------------|----------------|--------------------------------|
| post_number      | string         | null: false                    |
| area_id          | integer        | null: false                    |
| city             | string         | null: false                    |
| house_num        | string         | null: false                    |
| building_name    | string         |                                |
| phone_number     | string         | null: false                    |
| order            | references     | null: false, foreign_key: true |

### Association

* belongs_to :order

## orders テーブル

| Column           | Type           | Options                        |
|------------------|----------------|--------------------------------|
| item             | references     | null: false, foreign_key: true |
| user             | references     | null: false, foreign_key: true |

### Association

* belongs_to :user
* belongs_to :item
* has_one :address


アプリケーション名             ”furima-36771”

アプリケーション概要          	このアプリケーションでできることを記述。
                             ・商品の出品、編集、削除をすることができ、また他ユーザーの商品をアプリケーション内にて購入することができる。
                             ・ログイン、ログアウト機能もあり、登録することができる

URLデプロイ済みのURLを記述      デプロイが済んでいない場合は、デプロイが完了次第記述すること。

テスト用アカウント             ログイン機能等を実装した場合は、ログインに必要な情報を記述。またBasic認証等を設けている場合は、
                            そのID/Passも記述すること。

利用方法                     このアプリケーションの利用方法を記述。
                           ・商品の、売買を行うことができる

目指した課題解決    	      このアプリケーションを通じて、どのような人の、どのような課題を解決しようとしているのかを記述。
                          ・少ない手間、多く情報を閲覧することができ、売買したいユーザー向け

洗い出した要件	              スプレッドシートにまとめた要件定義を記述。


実装した機能についての画像やGIFおよびその説明	実装した機能について、それぞれどのような特徴があるのかを列挙する形で記述。
                                         画像はGyazoで、GIFはGyazoGIFで撮影すること。

実装予定の機能	                           洗い出した要件の中から、今後実装予定の機能がある場合は、その機能を記述。

データベース設計	                  ER図等を添付。

ローカルでの動作方法                      git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述。
                                      この時、アプリケーション開発に使用した環境を併記することを忘れないこと（パッケージやRubyのバージョンなど）。