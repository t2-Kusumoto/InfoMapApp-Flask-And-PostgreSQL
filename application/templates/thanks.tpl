<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Thank you!</title>
  <style>
  body {
    color: #311;
  }

  span {
    display: inline-block;
    margin-bottom: 15px;
  }

  .send {
    width: 280px;
    height: 30px;
    margin-bottom: 15px;
    border: solid 1px #88a;
    border-radius: 20px;
    background: #fff;
    color: #354aff;
    cursor: pointer;
  }

  .send:hover {
    opacity: 0.7;
  }


  @media (max-width: 1025px) {
  }

  @media (max-width: 480px) {
  }
  </style>
</head>
<body>
  <h3>情報の投稿ありがとうございます！</h3>
  <p>投稿を削除する場合、以下の情報が必要となります</p>
  <span>投稿番号: {{ post_num }}</span><br>
  <span>パスワード: <input type="text" value="{{ passwd }}" id="passwd"></span>
  <br>
  <button class="send">パスワードをクリップボードにコピー</button>
  <hr>
  <form action="/" method="GET">
    <input type="submit" value="地図に戻る" class="send">
  </form>
  <form action="/view" method="POST">
    <input type="hidden" name="shopcode" value="{{ shopcode }}">
    <input type="hidden" name="shopname" value="{{ shopname }}">
    <input type="submit" value="情報ページをみる" class="send">
  </form>

  <script>
  {
    'use strict';

    const btn = document.getElementById('btn');

    btn.addEventListener('click', () => {
      const copyText = document.getElementById('passwd');
      copyText.select();
      document.execCommand('copy');
    });
  }
  </script>
</body>
</html>
