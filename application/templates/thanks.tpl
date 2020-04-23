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
{% block main %}
  <h3>情報の投稿ありがとうございます！</h3>
  <p>投稿を削除する場合、以下の情報が必要となります</p>
  <span>投稿番号: {{ post_num }}</span><br>
  <span>パスワード: <input type="text" value="{{ passwd }}" id="passwd"></span>
  <br>
  <button class="send" id="copy">パスワードをクリップボードにコピー</button>
  <hr>
  <form action="/" method="GET">
    <input type="submit" value="地図に戻る" class="send">
  </form>
  <form action="/view" method="POST">
    <input type="hidden" name="shopcode" value="{{ shopcode }}">
    <input type="hidden" name="shopname" value="{{ shopname }}">
    <input type="submit" value="情報ページをみる" class="send">
  </form>
  <form action="/#delete-post" method="GET">
    <input type="submit" value="品物情報を削除する" class="send">
  </form>
    <p>※このページでページバック、リロード操作を行わないでください<br>
    パスワードが確認できなくなります</p>
  <script>
  {
    'use strict';

    const copy = document.getElementById('copy');

    copy.addEventListener('click', () => {
      const copyText = document.getElementById('passwd');
      copyText.select();
      document.execCommand('copy');
    });
  }
  </script>
{% endblock %}
