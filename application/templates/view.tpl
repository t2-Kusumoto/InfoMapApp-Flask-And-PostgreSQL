<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>春日井市西部 コロナ対策製品販売状況</title>
  <style>
    body {
      /* background: #fdfcef; */
      color: #311;
    }
    h3 {
    }
    .messageBox {
      margin: 0 auto;
      width: 90%;
      height: 500px;
      overflow-y: scroll;
      /* border: solid 2px #aaa; */
    }
    .message {
      width:100%;
      height:auto;
      margin-bottom: 20px;
      background: #fff;
      color: #622;
      border: double 6px #bbc;
      box-sizing: border-box;
    }
    table {
      margin: 3% 5%;
    }
    td {
      width: 30%;
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
      table {
        font-size: 14px;
      }
    }
  </style>
</head>
<body>
  <h3>◆ {{ shopname }} ◆</h3>
  <span>※ 投稿日時を確認してください</span>
  <hr>
  <div class="messageBox">
    {% if infomation %}
      {% for info in infomation %}
        <div class="message">
          <span id="date">● 投稿日時: {{ info["date"] }}</span>
          <table border=1>
            <tr>
              <th>品名</th>
              <th>あった？</th>
            </tr>
            <tr>
              <td>マスク</td>
              <td>{{ info["mask"] }}</td>
            </tr>
            <tr>
              <td>ウェットティッシュ</td>
              <td>{{ info["paper"] }}</td>
            </tr>
            <tr>
              <td>消毒液類</td>
              <td>{{ info["liquied"] }}</td>
            </tr>
            <tr>
              <td>除菌シート類</td>
              <td>{{ info["sheet"] }}</td>
            </tr>
          </table>
          <div id="text"><strong>その他の品物の情報:</strong> <hr>{{ info["text"] }}</div>
        </div>
      {% endfor %}
    {% else %}
    <h3>まだ投稿がありません</h3>
    {% endif %}
  </div>
  <hr>
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
