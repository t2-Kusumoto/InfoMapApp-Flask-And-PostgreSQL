<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>春日井市西部 コロナ対策製品販売状況</title>
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
  </style>
</head>
<body>
  <h3>◆ ご意見、ご感想入力フォーム ◆</h3>
  <hr>
  <p>ご意見、ご感想に関するお断り</p>
  <ul>
    <li>お寄せいただいたご意見、ご感想は全て目を通すつもりですが、当方、普段従事している仕事の都合上、目を通すことの出来る時間が限られます（24時間以上業務を離れられない場合もあります）。その点、ご理解ください</li>
    <li>ご要望に対しての対応は、私個人の能力、都合、気分次第で決めさせていただきます。私個人の判断基準によって決定し、「社会通念」には従いません。</li>
  </ul>
  <form action="/opinions_insert" method="POST">
    <span>● 200文字以内で以下に入力してください</span><br>
    <textarea name="opinion" id="" cols="45" rows="8" maxlength="200"></textarea>
    <br>
    <input type="submit" value="送信する" onclick="return confirm('この内容で送信してよろしいですか?');" class="btn">
  </form>
  <hr>
  <form action="/" method="GET">
    <input type="submit" value="地図に戻る" class="btn">
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
