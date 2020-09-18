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




