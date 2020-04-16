<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>maps app</title>
  <link rel="stylesheet" href="../css/styles.css">
  <style>
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

    input {
      margin-bottom: 10px;
    }
  </style>
</head>
<body>
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
</body>
</html>
