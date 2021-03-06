# <span style="color: red; ">スタンプラリーアプリ</span>
## <span style="color: blue; ">機能要件洗い出し</span>
### <span style="color: green; ">第1弾(2021/4)</span>
***

#### 対象OS

| 要件(大)| 要件(中)| 要件(小)| 機能要件| 備考 |
| ---- | ---- | ---- | ---- | ---- |
| 対象OS | Android | OS 9 -11 | - | この辺り？（今は重要ではないので適当） |
| - | iOS | OS 13 -14 | - | この辺り？（今は重要ではないので適当） |
| - | Tablet / Pad も対応 | - | - | - |

#### 画面遷移

| 要件(大)| 要件(中)| 要件(小)| 機能要件| 備考 |
| ---- | ---- | ---- | ---- | ---- |
| 画面 | 画面遷移 | ボタンまたはアイコンタップで各機能の画面に移動できること | - | ログインは除く |

#### ログイン

| 要件(大)| 要件(中)| 要件(小)| 詳細化| 備考 |
| ---- | ---- | ---- | ---- | ---- |
| ログイン | ユーザー情報ログイン機能 | ユーザー情報はIDとパスワードを使用する | IDはメールアドレスを使用する | FirebaseAuthenticationを使用？ |
| - | - | - | パスワードは英数字8字以上 |  |
| - | - | - | 後からPasswordが設定し直せる |  |
| - | - | - | 通信環境がなくてもログインできること |  |
| - | - | - | 外部のアカウントと連携する（IDフェデレーション） |  |
| - | ログインのID省略機能 | ID入力を省略できる | 端末にIDを保持して、ログイン時に入力欄に表示 |  |
| - | ログインのID省略機能 | ID入力省略は選択できる | チェックボックスで選べるようにする | よくあるログイン画面のイメージ |
| - | セキュリティ | 暗号化 | パスワードはAES暗号化して保持 |  |
| - | - | - | IDはAES暗号化して保持 |  |
| - | - | - | メアドはAES暗号化して保持 |  |

文字の自動補完機能をどうするか（予測変換）

キャッシュ機能をつけるか

ログインのリトライ回数やログイン前の通信状況チェック


#### Map作成

| 要件(大)| 要件(中)| 要件(小)| 詳細化| 備考 |
| ---- | ---- | ---- | ---- | ---- |
| Map作成 | Mapを作成できる機能 | Map作成用の画面を設ける |  | 
| - | - | Mapはアプリ内に表示される | 現在地を中心に1kmで表示される | Mapの連携先のアプリは選べる？無料で使える？500mでもいいかも |
| - | - | - | スクロールできる・縮小と拡大が可能 | 設定できるものなのか？ |
| - | - | - | スクロールで移動後、現在地に戻ることができる（ボタンを用意） | |
| - | - | Map上にピンを配置する | ピンの位置（緯度経度）を保持 | スタンプポイントにする |
| - | - | - | ピンの数は10個まで | 決めなくてもいいけど、決めてもいいと思う。初期値として |
| - | - | - | ピンの最大数は変更できる |  |
| - | - | - | ピンは削除できる |  |
| - | - | - | ピンは移動できる |  |
| - | - | - | ピンの場所を保存できる。名称と緯度経度を確認して保存| 都度入力を必要にするか、必須ではなく1操作を加えるかは悩み(モックで検討?) |
| - | - | - | 名称はユーザー入力、デフォルトはピン1~10とする | |
| - | - | - | ピンには説明欄や画像を保存できるようにする | 画像は解像度を下げる必要があるか・・ |
| - | - | - | 設定中のピンの数がわかる | 5/10とか表示する |
| - | - | - | 設定しているピンのリスト表示ができる |  |
| - | - | - | ピンをタップで吹き出しで設定値を確認 | ＋α |
| - | - | - | ピンに設定するスタンプを選択できる | ＋α |
| - | - | Mapを保存できる | Map名とタグを設定して保存する | タグは必須ではない |
| - | - | - | 市町村はMap情報して保存する |  |
| - | - | - | ピンが0の場合はMapを保存できない |  |
| - | - | - | Mapを保存する時にはピンのリストが確認できる |  |

#### Mapを使う

| 要件(大)| 要件(中)| 要件(小)| 詳細化| 備考 |
| ---- | ---- | ---- | ---- | ---- |
| Map表示 | お勧め表示機能 | お勧めや人気マップが表示される画面を設けること |  | ユーザー導線。初期はお勧めのみ、かつデフォルトマップのみ。位置情報から現在地付近で使用できるマップを将来的には表示したい。メインのページ（Lineのホームのページのイメージ）表示か。 |
| - | Mapを表示できる機能 | 使用中のMapが表示される画面を設けること |  |  |
| - | - | Mapはアプリ内に表示される | 現在地を中心に1kmで表示される | ※Map作成と同じ |
| - | - | - | スクロールできる・縮小と拡大が可能 | ※Map作成と同じ |
| - | - | - | スクロールで移動後、現在地に戻ることができる（ボタンを用意） | ※Map作成と同じ |
| - | - | - | Mapは更新できる、更新ボタンを設けるかリアルタイムに更新か | ※Map作成と同じ |
| - | - | - | スタンプ獲得数と全スタンプ数を表示する |  |
| - | - | Map上にピンを配置する | ピンの位置（緯度経度）を保持 | ※Map作成と同じ |
| スタンプ | スタンプ獲得機能 | GETスタンプボタンを押下してスタンプを獲得する |  |  
| - | - | スタンプ獲得判定は緯度経度を使用する | 判定は「度」で行う？ |  |
| - | - | スタンプ獲得判定成功後、スタンプ取得数を保存する |  |  |
| - | - | スタンプ獲得時にはスタンプカードを表示する |  |  |
| - | - | スタンプ獲得時にはスタンプカードに順にスタンプを押下する |  | アニメーションはできれば... |
| - | - | スタンプ獲得時にはスタンプカードは10枚毎に表示 |  |  |
| - | - | スタンプカードはボタン押下で次のカードへ移動する |  |  |
| - | - | スタンプカードはボタン押下で閉じる |  |  |

※デフォルトマップは30用意する
（おそらく位置情報だけ覚えてれば良いので・・・）
 観光用のMap、月島もんじゃ用Map、お試し用の渋谷Map、

#### Map整理
 
| 要件(大)| 要件(中)| 要件(小)| 詳細化| 備考 |
| ---- | ---- | ---- | ---- | ---- |
| Map整理 | Mapを一覧表示する機能 | Map一覧・検索可能な画面を設けること |  | 検索はタグと都道府県・市町村まで（海外の場合も同じ？） |
| - | - | 一覧にはMapタイトルが表示されること |  |  |
| - | - | 一覧にはタグが表示されること |  |  |
| - | - | 一覧には追加日が表示されること |  |  |
| - | - | 一覧には作成者が表示されること |  |  |
| - | - | タグごとに表示されること |  |  |
| - | - | Mapは追加順に並べること（新しい方が上） |  |  |

#### マイページ
| 要件(大)| 要件(中)| 要件(小)| 詳細化| 備考 |
| ---- | ---- | ---- | ---- | ---- |
| マイページ | アカウント情報を表示する | IDは表示 |  |  |
| - | Map情報を表示する | 作成したMapを確認できる |  |  |
| - | - | クリアしたMapを確認できる |  |  |

#### Appレビュー

| 要件(大)| 要件(中)| 要件(小)| 詳細化| 備考 |
| ---- | ---- | ---- | ---- | ---- |
| Appレビュー | 評価機能 | 10日以上ログインしたユーザーで表示 |  |  |

#### アナリティクス

| 要件(大)| 要件(中)| 要件(小)| 詳細化| 備考 |
| ---- | ---- | ---- | ---- | ---- |
| アナリティクス | アナリティクス機能 | 利用許諾で情報収集可能とする |  |  |
| - | - | オプトインアウト機能を設ける |  |  |
| - | - | クラッシュ情報は収集 |  | FirebaseCrash |
| - | - | 性能情報は収集 |  | FirebasePerformance |
