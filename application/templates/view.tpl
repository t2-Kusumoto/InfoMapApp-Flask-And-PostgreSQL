<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>view</title>
  <style>
    .messageBox {
      margin: 0 auto;
      width: 90%;
      height:500px;
      overflow-y: scroll;
    }
    .message {
      width:100%;
      height:45%;
      background: #000;
      color: #fff;
      border: solid 1px pink;
      box-sizing: border-box;
    }
  </style>
</head>
<body>
  <h2>OO 店 の在庫状況に関する投稿</h2>
  <div class="messageBox">
    <div class="message">
      <span id="date">2020-03-28 00:00</span><br>
      mask <span id="mask">oo 在庫あり</span><br>
      paper <span id="paper">^^ 在庫僅か</span><br>
      liquid <span id="liquid">xx 在庫なし</span><br>
      sheets <span id="sheets">?? 分からない</span><br>
      <span id="text">Hello World. Hello World. Hello World. Hello World. Hello World. Hello World. Hello World.</span>
    </div>
    <div class="message">
      <span id="date">2020-03-28 00:00</span><br>
      mask <span id="mask">oo 在庫あり</span><br>
      paper <span id="paper">^^ 在庫僅か</span><br>
      liquid <span id="liquid">xx 在庫なし</span><br>
      sheets <span id="sheets">?? 分からない</span><br>
      <span id="text">Hello World. Hello World. Hello World. Hello World. Hello World. Hello World. Hello World.</span>
    </div>
    <div class="message">
      <span id="date">2020-03-28 00:00</span><br>
      mask <span id="mask">oo 在庫あり</span><br>
      paper <span id="paper">^^ 在庫僅か</span><br>
      liquid <span id="liquid">xx 在庫なし</span><br>
      sheets <span id="sheets">?? 分からない</span><br>
      <span id="text">Hello World. Hello World. Hello World. Hello World. Hello World. Hello World. Hello World.</span>
    </div>
    <div class="message">
      <span id="date">2020-03-28 00:00</span><br>
      mask <span id="mask">oo 在庫あり</span><br>
      paper <span id="paper">^^ 在庫僅か</span><br>
      liquid <span id="liquid">xx 在庫なし</span><br>
      sheets <span id="sheets">?? 分からない</span><br>
      <span id="text">Hello World. Hello World. Hello World. Hello World. Hello World. Hello World. Hello World.</span>
    </div>
  </div>
  <div id="link">
    <form action="/" method="GET">
      <input type="submit" value="Mapへ戻る">
    </form>
    <form action="/form" method="POST">
      <input type="hidden" name="shopcode" value="0001">
      <input type="submit" value="情報を入力する">
    </form>
  </div>
</body>
</html>
