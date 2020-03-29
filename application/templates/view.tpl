<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>view</title>
  <style>
    body {
      background: #ffd;
    }
    .messageBox {
      margin: 0 auto;
      width: 90%;
      height: 500px;
      overflow-y: scroll;
    }
    .message {
      width:100%;
      height:auto;
      background: #fff;
      color: #622;
      border-bottom: solid 20px #ffd;
      box-sizing: border-box;
    }
    table {
      margin: 3% 5%;
    }
    td {
      width: 25%;
    }
    #text {
      margin: 3% 5%;
    }

    .btn {
      margin-top: 15px;
      width: 120px;
    }
    @media (max-width: 1025px) {
    }

    @media (max-width: 480px) {
      .btn {
        margin-top: 5%;
        display: block;
        width: 35%;
      }
    }
  </style>
</head>
<body>
  <h2>{{ shopname }}</h2>
  <hr>
  <div class="messageBox">
    {% if infomation %}
      {% for info in infomation %}
        <div class="message">
          <span id="date">投稿日時: {{ info["date"] }}</span>
          <table>
            <tr>
              <td>マスク</td>
              <td> {{ info["mask"] }}</td>
            </tr>
            <tr>
              <td>トイレットペーパー</td>
              <td> {{ info["paper"] }}</td>
            </tr>
            <tr>
              <td>消毒液類</td>
              <td> {{ info["liquied"] }}</td>
            </tr>
            <tr>
              <td>除菌シート類</td>
              <td> {{ info["sheet"] }}</td>
            </tr>
          </table>
          <div id="text">その他の情報: <hr>{{ info["text"] }}</div>
        </div>
      {% endfor %}
    {% else %}
    <h3>まだ投稿がありません</h3>
    {% endif %}
  </div>
  <div id="link">
    <form action="/form" method="POST">
      <input type="hidden" name="shopcode" value="{{ shopcode }}">
      <input type="hidden" name="shopname" value="{{ shopname }}">
      <input type="submit" value="情報を入力する" class="btn">
    </form>
    <form action="/" method="GET">
      <input type="submit" value="地図に戻る" class="btn">
    </form>
  </div>
</body>
</html>
