{% extends "base.html" %}
{% block head %}
  {{ super() }}
  <style>
  body {
    padding: 1em;
  }
</style>
{% endblock %}
{% block main %}
  <h2>このページは？</h2>
  <ul>
    <li>投稿受け付け画面よりページバックした画面で、投稿が行われた</li>
    <li>投稿受け付け画面でリロードが行われた</li>
  </ul>
  <p>上記いずれかの操作が行われたため、このページが表示されています</p>
  <p>上記いずれの場合も投稿は受け付け済みです。</p>
  <p>以下の「地図に戻る」ボタンよりお戻りください</p>
  <form action="/" method="GET">
    <input type="submit" value="地図に戻る" class="send">
  </form>
{% endblock %}
