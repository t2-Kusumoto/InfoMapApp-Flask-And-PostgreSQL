{% extends "base.html" %}
{% block head %}
  {{ super() }}
  <style>
    .messageBox {
      margin: 0 auto;
      width: 90%;
      height: 500px;
      overflow-y: scroll;
    }

    .message {
      width:100%;
      height:auto;
      margin-bottom: 20px;
      background: #fff;
      color: #622;
      border: solid 2px #bbc;
      box-sizing: border-box;
    }

    table {
      margin: 3% 5%;
    }

    td {
      width: 30%;
    }

    #text {
      margin: 3% 5%;
      word-wrap: break-word;
    }
    @media (max-width: 1025px) {
    }

    @media (max-width: 480px) {

      table {
        font-size: 14px;
      }
    }
  </style>
{% endblock %}
{% block main %}
  <h3>◆ {{ shopname }} ◆</h3>
  <span>※ 投稿日時を確認した上で、情報を参考にするか否かの判断をしていただくようお願いします</span>
  <hr>
  <div id="link">
    <form action="/form" method="POST">
      <input type="hidden" name="shopcode" value="{{ shopcode }}">
      <input type="hidden" name="shopname" value="{{ shopname }}">
      <input type="hidden" name="time" value="" id="time">
      <input type="submit" value="情報を入力する" class="send">
    </form>
    <form action="/" method="GET">
      <input type="submit" value="地図に戻る" class="send">
    </form>
  </div>
  <hr>
  <div class="messageBox">
    {% if infomation %}
      {% for info in infomation %}
        <div class="message" id="{{ info['no'] }}">
          <span id="date">● 投稿番号: No.{{ info['no'] }}</span><br>
            <span>投稿日時: {{ info["date"] }}</span>
          <table border=1>
            <tr>
              <th>品名</th>
              <th>減り具合</th>
            </tr>
            {% for key in info["data"] %}
              <tr>
                <td>{{ key }}</td>
                <td>{{ info["data"][key] }}</td>
              </tr>
            {% endfor %}
          </table>
          <div id="text"><strong>その他製品の情報:</strong> <hr>
            {{ info["text"] }}
          </div>
        </div>
      {% endfor %}
    {% else %}
    <h3>まだ投稿がありません</h3>
    {% endif %}
  </div>
  <script>
    {
      'use strict';
      window.onload = () => {
        const target = document.getElementById('time');
        time.value = Date.now();
      }
    }
  </script>
{% endblock %}
