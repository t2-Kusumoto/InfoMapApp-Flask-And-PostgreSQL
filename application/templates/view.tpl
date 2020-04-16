<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>maps app</title>
  <style>
    body {
      color: #311;
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
      margin-bottom: 20px;
      background: #fff;
      color: #622;
      border: solid 2px #bbc;
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
    .send {
      width: 280px;
      height: 30px;
      margin-bottom: 15px;
      border: solid 1px #88a;
      border-radius: 20px;
      background: #fff;
      color: #354aff;
      cursor: pointer;
    }

    .send:hover {
      opacity: 0.7;
    }

    @media (max-width: 1025px) {
    }

    @media (max-width: 480px) {

      table {
        font-size: 14px;
      }
    }
  </style>
</head>
<body>
  <h3>◆ {{ shopname }} ◆</h3>
  <hr>
  <div id="link">
    <form action="/form" method="POST">
      <input type="hidden" name="shopcode" value="{{ shopcode }}">
      <input type="hidden" name="shopname" value="{{ shopname }}">
      <input type="hidden" name="time" value="" id="time">
      <input type="submit" value="情報を入力する" class="send">
    </form>
    <form action="/" method="GET">
      <input type="submit" value="地図に戻る" class="send">
    </form>
  </div>
  <hr>
  <div class="messageBox">
    {% if infomation %}
      {% for info in infomation %}
        <div class="message" id="{{ info['no'] }}">
          <span id="date">● 投稿番号: No.{{ info['no'] }}</span><br>
            <span>投稿日時: {{ info["date"] }}</span>
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
              <td>ウエットティッシュ</td>
              <td>{{ info["wet"] }}</td>
            </tr>
            <tr>
              <td>ハンドソープ</td>
              <td>{{ info["soap"] }}</td>
            </tr>
            <tr>
              <td>ミネラルウォーター</td>
              <td>{{ info["water"] }}</td>
            </tr>
            <tr>
              <td>お米</td>
              <td>{{ info["rice"] }}</td>
            </tr>
            <tr>
              <td>インスタント麺</td>
              <td>{{ info["noodles"] }}</td>
            </tr>
            <tr>
              <td>パスタ類</td>
              <td>{{ info["pasta"] }}</td>
            </tr>
          </table>
          <div id="text"><strong>その他製品の情報:</strong> <hr>{{ info["text"] }}</div>
        </div>
      {% endfor %}
    {% else %}
    <h3>まだ投稿がありません</h3>
    {% endif %}
  </div>
  <script>
    {
      'use strict';
      window.onload = () => {
        const target = document.getElementById('time');
        time.value = Date.now();
      }
    }
  </script>
</body>
</html>
