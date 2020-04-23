{% extends "base.html" %}
{% block head %}
  {{ super() }}
  <style>
    span {
      display: inline-block;
      margin-bottom: 15px;
    }
  </style>
{% endblock %}
{%block main %}
  <h3>ご意見、ご感想を承りました</h3>
  <p>投稿を削除する場合、以下の情報が必要となります</p>
  <span>投稿番号: {{ post_num }}</span><br>
  <span>パスワード: <input type="text" value="{{ passwd }}" id="passwd"></span>
  <br>
  <button class="send" id="copy">パスワードをクリップボードにコピー</button>

  <p>内容は「ご意見、ご感想入力フォーム」の「寄せられたご意見、ご感想」で確認できます。</p>
  <p>※このページでページバック、リロード操作を行わないでください<br>
  パスワードが確認できなくなります</p>
  <form action="/" method="GET">
    <input type="submit" value="地図に戻る" class="send">
  </form>
  <form action="/opinions_and_impression" method="POST">
    <input type="hidden" name="time" value="" id=time>
    <input type="submit" value="投稿を確認する" class="send">
  </form>
  <form action="/#delete-post" method="GET">
    <input type="submit" value="ご意見、ご感想を削除する" class="send">
  </form>

  <script>
  {
    'use strict';

  // パスワードのクリップボードへのコピー
    const copy = document.getElementById('copy');

    copy.addEventListener('click', () => {
      const copyText = document.getElementById('passwd');
      copyText.select();
      document.execCommand('copy');
    });

  // session管理用トークン生成に使う値
    let time = Date.now()
      const setTime = document.getElementById('time')
      setTime.value = time;

  }
  </script>
{% endblock %}
