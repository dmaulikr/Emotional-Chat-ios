# 電話(リアルタイムチャット)-Client側テスト用プログラム
## 最終目標
Rubyサーバを経由したリアルタイム通話のモバイルアプリ作成 by Swift3

## 方針
#### 1.ソケット通信(リアルタイム性を重視するため)
#### 2.JSON使用(音声だけでなく発信者や日付など多数のデータをやりとりしたい)

## (次の)目標
* serverのDBを活用したい
* 複数のClientに対応したい

## 進捗と現状
* Rubyサーバとのリアルタイムチャットに成功
* Connectボタンでサーバと接続
* Sendボタンでテキストボックス内のテキストを送信
* Endボタンで切断
* TCP-socketでの通信
* connect後、ReceiveとSendを並行させるためマルチスレッド使用

## 課題と不明点
* UI部分の改良(ログがスクロールできない)
* テキスト以外も表示できるようにしたい(Usernameとか)
* 音声ならUDPソケットの方が良いか

## メモ
* Socket.IO-Client-Swiftでも可能だが、厳密にはソケット通信じゃない?
* Socket通信にはSwiftSocketというpod使用
* UI部分の更新はメインスレッドで行わなくてはならない
* スレッドは.asyncで非同期指定
