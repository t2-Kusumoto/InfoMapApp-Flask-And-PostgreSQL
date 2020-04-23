{% extends "base.html" %}
  {% block head %}
    {{ super() }}
  <style>
      body {
        padding: 1em;
      }
      input {
      margin-bottom: 20px;
    }
  </style>
 {% endblock %}
{% block main %}
  <div class="contents">
    <h3>投稿削除用フォーム</h3>
    <p>投稿番号と6桁のパスワードを入力してください</p>
    <form action="/delete_row" method="POST">
      <input type="hidden", name="category", value="{{ category }}">
      <span>投稿番号 (半角数字のみ)</span><br>
      <input type="number" name="number" max=1000 required><br>
      <span>パスワード (半角英数字のみ)</span><br>
      <input type="text" name="passwd" maxlength="6" required><br>
      <input type="submit" value="投稿削除" class="send">
    </form>
    <hr>
    <form action="/" method="GET">
      <input type="submit" value="地図に戻る" class="send">
    </form>
  </div>
{% endblock %}
