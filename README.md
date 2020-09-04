# fleamarket_sample_78a_データベース設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|password_confirmation|string|null: false|
### Association
- has_many :items
- has_one :profile
- has_one :destination
- has_one :credit_card

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## destinationsテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|postal_code|integer|null: false|
|prefecture_code|integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|room_number|string||
|phone_number|integer|null: false|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_id|string|null: false|
|costumer_id|string|null: false|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|introduction|text|null: false|
|price|integer|null: false|
|category_id|references|null: false, foreign_key: true|
|size_id|references|foreign_key: true|
|brand_id|references|foreign_key: true|
|item_condition_id|references|null: false, foreign_key: true|
|postage_payer_id|references|null: false, foreign_key: true|
|prefecture_code|integer|null: false|
|preparation_day_id|references|null: false, foreign_key: true|
|status_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
### Association
- has_many :images
- belongs_to :category
- belongs_to :size
- belongs_to :brand
- belongs_to :item_condition
- belongs_to :potage_payer
- belongs_to :preparation_day
- belongs_to :status
- belongs_to :user


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|item_id|references|null: false, foreign_key: true|
### Association
- belongs_to :item

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category|string|null: false|
|ancestry|string|null: false|
### Association
- has_many :items

## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|size|string|null: false|
### Association
- has_many :items

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|brand|string|null: false|
### Association
- has_many :items

## item_conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|item_condition|string|null: false|
### Association
- has_many :items

## postage_payersテーブル
|Column|Type|Options|
|------|----|-------|
|postage_payer|string|null: false|
### Association
- has_many :items

## preparation_daysテーブル
|Column|Type|Options|
|------|----|-------|
|preparation_days|string|null: false|
### Association
- has_many :items

## statusesテーブル
|Column|Type|Options|
|------|----|-------|
|status|string|null: false|
### Association
- has_many :items


