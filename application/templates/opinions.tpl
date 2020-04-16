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
      margin: 1.5em;
    }

    ul > li {
      font-size: 14px;
    }

    .btn {
      margin-top: 15px;
      width: 120px;
    }

    .box {
      margin: 20px 0;
      height: 600px;
      overflow-y: scroll;
    }

    .message {
      padding: 1em;
      margin-bottom: 15px;
      border: solid 2px #ccb;
    }

    .box > .message > p {
      margin: 0 0 1em 0;
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
  </style>
</head>
<body>
  <h3>◆ ご意見、ご感想入力フォーム ◆</h3>
  <hr>
  <form action="/opinions_insert" method="POST">
    <span>● 200文字以内で以下に入力してください</span><br>
    <textarea name="opinion" id="" cols="40" rows="9" maxlength="200"></textarea>
    <br>
    <input type="hidden" name="time" value="{{ time }}">
    <input type="submit" value="送信する" onclick="return confirm('この内容で送信してよろしいですか?');" class="send">
  </form>
  <hr>
  <form action="/" method="GET">
    <input type="submit" value="地図に戻る" class="send">
  </form>
  <hr>
<h3>◆ 寄せられたご意見、ご感想 ◆</h3>
<div class="box">
  {% for opi in opinions %}
    <div class="message">
      <p>・<strong>No.{{ opi["no"] }}:</strong> <u>{{ opi["date"] }}</u></p>
      {{ opi["opinion"] }}
      <hr>
      {% if opi["response"] %}
      <p>・<strong>Re: No.{{ opi["no"] }}:</strong></p>
      {{ opi["response"] }}
      {% endif %}
    </div>
  {% endfor %}
</div>
</body>
</html>
