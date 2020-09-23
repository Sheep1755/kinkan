# README

## アプリケーション概要

勤怠管理を行えるアプリケーションとなっています。

## URL

以下のURLで動作確認をすることができます。
テスト用のアカウト情報はトップページに記載しています。

https://kinkan1.herokuapp.com/

## 機能一覧

* ユーザー管理機能
  - 名前/メールアドレス/パスワード
* 現在時刻表示機能
  - トップページに現在日時及び時刻を表示  
* 出退勤打刻機能
  - ログイン済のユーザーのみ打刻可能
  - 出勤・退勤ボタンをそれぞれ打刻した時間が出勤簿に反映される
* 出勤簿表示機能
  - ログイン済のユーザーのみ閲覧可能
  - 上記、出退勤の時間を表示
  - 退勤時間から出勤時間を差し引いた時間がその日の勤務時間として表示される
    (出勤9:00~退勤18:00で記録された場合、休憩時間1時間が差し引かれるようになっているため勤務時間は8時間と表示される)
  - 勤務時間が8時間以上の場合は残業時間が記録される
  - 休暇申請を行った場合、備考欄に休暇区分が表示される  
* 休暇申請機能
  - ログイン済のユーザーのみ申請可能
  - 日付を選択し、休暇区分（有給休暇等）と申請理由を書いて申請が行えるようになっている。それぞれ、記述がない場合は申請することができない。

## バージョン

ruby 2.6.5  Rails 6.0.3.2

## 使用Gem

 * devise
 * haml-rails >= 1.0, <= 2.0.1
 * font-awesome-sass
 * pry-rails
 * jquery-rails
 * rails-i18n
 * pg

## DB設計
userテーブル
|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|email|string|null: false, unique: true, default: ""|
|password|string|null: false, unique:true, default: ""|
* Association
- has_many :timecard
- has_many :holiday

timecardテーブル
|Column|Type|Option|
|------|----|------|
|start_time|string|
|end_time|string|
|total_time|string|
|lost_time|string|
|user|references|null: false, foreign_key: true|
* Association
- belongs_to :user

holidayテーブル
|Column|Type|Option|
|------|----|------|
|holiday_division|string|
|holiday_reason|text|
|status|date|
|user|references|null: false, foreign_key: true|

* Association
- belongs_to :user

## 制作背景

エンジニア転職を目的としてこのアプリケーションを作成しました。
自身がエンジニアになった際には働く人の業務の効率化を図れるものを作ることに携わっていきたいと考えています。
その考えに基づき、勤怠管理、つまり労働時間を管理するということは業務の効率化を考える上での根幹的な部分であると思いますので、
今回のアプリケーションの作成に至りました。

## 工夫ポイント

1日8時間勤務を想定した上で、労働過多になっていないか視覚的に見れるように、その日の労働時間が8時間を超えたら、
残業時間がカウントされるようになっています。

## 課題＆今後実装予定

 * 打刻が１日何回もできるようになってしまっているため制限を掛けられるようにしたい。
 * 出勤簿の修正機能の実装
 * 上長による休暇申請の承認機能

 
 







