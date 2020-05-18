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

# MEMOMA DB
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|sting|null: false|
|password|string|null: false|
|nickname|string|null: false|
### Association
- has_many :themes
- has_many :posts
- has_many :summaries
- has_many :importants

## themesテーブル
|Column|Type|Options|
|------|----|-------|
|title|text||
### Association
- belongs_to :user
- has_many :posts
- has_one :summary

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|theme_id|integer||
### Association
- belongs_to :theme
- belongs_to :user
- has_one :important

# summariesテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|theme_id|integer||
|user_id|integer||
### Association
- belongs_to :user
- belongs_to :theme

# importantsテーブル
|Column|Type|Options|
|------|----|-------|
|post_id|integer||
### Association
- belongs_to :user
- belongs_to :post