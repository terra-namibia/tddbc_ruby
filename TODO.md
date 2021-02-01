# 仕様
## 前提条件
- [ ] 以下の商品情報があること
  - [x] ワードプロセッサ「MS Word」の価格は 18,800円
  - [x] ワードプロセッサ「一太郎」の価格は 20,000円
  - [ ] スプレッドシート「MS Excel」の価格は 27,800円
  - [x] スプレッドシート「三四郎」の価格は 5,000円

## 契約機能
- [ ] 商品の契約(contract)が成立（sign）した場合
  - [ ] 商品名がワードプロセッサの場合 「MS Word」「一太郎」
    - [x] ワードプロセッサは契約日（signed_on）に直ちに売上（revenue）全額を収益認識（revenue recognition）すること
  - [ ] 商品名がスプレッドシートの場合 「MS Excel」「三四郎」
    - [ ] 契約日（signed_on）に売上（revenue）の2/3収益認識（revenue recognition）すること
      - [ ] 小数点切り上げする (ドメインロジック早めに売上計上したいので。)
    - [ ] 契約日（signed_on）の30日後に売上（revenue）の1/3を収益認識（revenue recognition）すること

- [ ] 収益認識(revenue recognition)の総和は売上(revenue)とかならず 完全一致すること

## 考えなくていいこと
- 商品の契約(contract)が成立しないもの

# 実装メモ
- [ ] Contractクラスがあること
- [ ] Contractクラスのspecがあること
- [ ] Productリストがあること
  - [ ] name: msword, price: 18,800
  - [ ] name: ichitaro, price: 20,000


