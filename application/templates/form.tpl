  {% extends "base.html" %}
  {% block head %}
    {{ super() }}
  <style>
  h3 {
    margin: 0;
  }

  span {
    display: inline-block;
    margin-top: 0.5em;
  }

  #container {
    margin: 0 auto;
    display: flex;
    flex-wrap: wrap;
    width: 85%;
    height: 560px;
    overflow-y: scroll;
    border: 2px solid #ddd;
  }
  select {
    width: 200px;
    height: 30px;
    background: #fff;
    border: solid 1px #88f;
    border-radius: 6px;
  }
  .radio {
    display: inline-block;
    margin: 10px 0 0 10px;
  }
  .box {
    width: 100%;
    height: 160px;
    margin-left: 10px;
  }
  textarea {
    margin: 0 20px 10px;
  }
  </style>
{% endblock %}
{% block main %}
  <h3>◆ <u>{{ shopname }}</u> ◆</h3>
  <span>※正確な情報の提供をお願いします</span>
  <hr>
  <form action="/insert_info" method="POST" accept-charset="UTF-8" name="reset">
    <input type="hidden" name="time" value="{{ time }}" id="time">
    <h4>選択式入力欄 (最大１０品)</h4>
    <div id="container"></div>
    <h4>より詳細な情報やその他製品の情報<br>(200文字以内)</h4>
      <textarea name="text" id="" cols="40" rows="9" maxlength="200"></textarea>
    <input type="hidden" name="shopcode", value="{{ shopcode }}">
    <input type="hidden" name="shopname", value="{{ shopname }}">
    <br>
    <input type="submit" value="投稿する" onclick="return confirm('この内容で投稿してよろしいですか?');" class="send" id="btn">
    <br>
  </form>
  <hr>
  <form action="/" method="GET">
    <input type="submit" value="地図に戻る" class="send">
  </form>

<script src="/static/createSelectForm.js"></script>

{% endblock %}
