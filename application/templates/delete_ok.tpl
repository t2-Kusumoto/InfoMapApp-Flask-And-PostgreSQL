{% extends "base.html" %}
{% block head %}
  {{ super() }}
{% endblock %}
{% block main %}
  <h2>投稿が削除されました</h2>
  <form action="/" method="GET">
    <input type="submit" value="地図に戻る" class="send">
  </form>
{% endblock %}
