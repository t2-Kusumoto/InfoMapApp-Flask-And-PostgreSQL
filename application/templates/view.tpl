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
  <h2>{{ shopname }}の在庫状況に関する投稿</h2>
  <div class="messageBox">
    {% if infomation %}
      {% for info in infomation %}
        <div class="message">
          <span id="date">{{ info["data"] }}</span><br>
          mask <span id="mask">{{ info["mask"] }}</span><br>
          paper <span id="paper">{{ info["paper"] }}</span><br>
          liquid <span id="liquid">{{ info["liqied"] }}</span><br>
          sheets <span id="sheets">{{ info["sheet"] }}</span><br>
          <span id="text">{{ info["text"] }}</span>
        </div>
      {% endfor %}
    {% else %}
    <h3>まだ投稿がありません</h3>
    {% endif %}
  </div>
  <div id="link">
    <form action="/" method="GET">
      <input type="submit" value="Mapへ戻る">
    </form>
    <form action="/form" method="POST">
      <input type="hidden" name="shopcode" value="{{ shopcode }}">
      <input type="hidden" name="shopname" value="{{ shopname }}">
      <input type="submit" value="情報を入力する">
    </form>
  </div>
</body>
</html>
