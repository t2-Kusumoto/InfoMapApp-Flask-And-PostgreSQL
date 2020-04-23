{% extends "base.html" %}
{% block head %}
  {{ super() }}
  <style>
  body {
    padding:1em;
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
      height: 720px;
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
{% endblock %}

{% block main %}
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
  <p>ご意見、ご感想に関するお断り</p>
  <ul>
    <li>お寄せいただいたご意見、ご感想は全て目を通すつもりですが、当方、普段従事している仕事の都合上、目を通すことの出来る時間が限られます（24時間以上業務を離れられない場合もあります）。その点、ご理解ください</li>
    <li>ご要望に対して行われる対応は、サイト管理者個人の能力、都合、気分に拠ります。サイト管理者個人の判断により決定され、他のいかなる基準にも従いません。</li>
  </ul>
  <form action="/opinion_delete" method="GET">
    <input type="submit" value="ご意見、ご感想を削除する" class="send">
  </form>
  <hr>
<h3>◆ 寄せられたご意見、ご感想 ◆</h3>
<div class="box" id="opinions">
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
{% endblock %}
