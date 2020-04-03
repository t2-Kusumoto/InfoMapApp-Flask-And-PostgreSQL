<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Thank you!</title>
  <style>
  body {
    /* background: #fdfcef; */
    color: #311;
  }
  .btn {
    margin-top: 15px;
    width: 120px;
  }
  @media (max-width: 1025px) {
  }

  @media (max-width: 480px) {
    .btn {
      margin-top: 5%;
      display: block;
      width: 35%;
    }
  }
  </style>
</head>
<body>
  <h1>情報の投稿ありがとうございます！</h1>
  <form action="/" method="GET">
    <input type="submit" value="地図に戻る" class="btn">
  </form>
  <form action="/view" method="POST">
    <input type="hidden" name="shopcode" value="{{ shopcode }}">
    <input type="hidden" name="shopname" value="{{ shopname }}">
    <input type="submit" value="情報ページをみる" class="btn">
  </form>
</body>
</html>
