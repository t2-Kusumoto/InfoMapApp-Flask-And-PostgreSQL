{% extends "base.html" %}
{% block head %}
  {{ super() }}
{% endblock %}
{%block main %}
  <h2>投稿を削除出来ませんでした</h2>
  <p>投稿番号、パスワードが間違っていないか確認してください</p>
  <form action="/" method="GET">
    <input type="submit" value="地図に戻る" class="send">
  </form>
{% endblock %}
