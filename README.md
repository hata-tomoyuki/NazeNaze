# Name
MEMOMA

# Overview
You can take memos for making creative ideas, deepen your thought and self-analysis.

## What you can
You can take memos freely after setting a theme about memos you want to take. If memos you take is important, ckick the star mark to marking. After taking memos, you can make summary of memos. If you can make summary, your thought will be more clear before you take memos. You can delete themes, memos and summary by clicking garbage can mark or delete button.

## How to use
1. Sigh up with inputting nickname, e-mail address and password.
2. Set the name of theme by inputting from form and click "send" button.
3. Click the name of theme to move the screen for posting memos.
4. Post memos freely by inputting from form and click "send" button.
5. If you finished posting memos, click the "summary" button to move the screen for making summary.
6. Click the "create" buttom to make summary and input summary of memos to the text form.
6. Click the "complete" button to finish.

# MEMOMA Database
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