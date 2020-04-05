<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>春日井市西部 コロナ対策製品販売状況</title>
  <style>
  body {
    color: #311;
  }

  h3 {
    margin: 0;
  }

  span {
    display: inline-block;
    margin-top: 0.5em;
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
  <h3>◆ <u>{{ shopname }}</u> ◆</h3>
  <span>※正確な情報の提供をお願いします</span>
  <hr>
  <form action="/insert_info" method="POST" accept-charset="UTF-8">
    <span>・ マスク</span><br>
    <input type="radio" name="mask" value="green" id="g">
    <label for="g">あり</label>
    <input type="radio" name="mask" value="yellow" id="y">
    <label for="y">残り僅か</label>
    <input type="radio" name="mask" value="red" id="r">
    <label for="">なし</label>
    <input type="radio" name="mask" value="white" id="w" checked>
    <label for="w"></label>分からない
      <br>
    <span>・ ウェットティッシュ</span><br>
    <input type="radio" name="wet" value="green" id="g">
    <label for="g">あり</label>
    <input type="radio" name="wet" value="yellow" id="y">
    <label for="y">残り僅か</label>
    <input type="radio" name="wet" value="red" id="r">
    <label for="">なし</label>
    <input type="radio" name="wet" value="white" id="w" checked>
    <label for="w"></label>分からない
      <br>
    <span>・ キッチンペーパー</span><br>
    <input type="radio" name="paper" value="green" id="g">
    <label for="g">あり</label>
    <input type="radio" name="paper" value="yellow" id="y">
    <label for="y">残り僅か</label>
    <input type="radio" name="paper" value="red" id="r">
    <label for="">なし</label>
    <input type="radio" name="paper" value="white" id="w" checked>
    <label for="w"></label>分からない
      <br>
    <span>・ ミネラルウォーター</span><br>
    <input type="radio" name="water" value="green" id="g">
    <label for="g">あり</label>
    <input type="radio" name="water" value="yellow" id="y">
    <label for="y">残り僅か</label>
    <input type="radio" name="water" value="red" id="r">
    <label for="">なし</label>
    <input type="radio" name="water" value="white" id="w" checked>
    <label for="w"></label>分からない
      <br>
    <p>・ より詳細な情報やその他製品の情報<br>(200文字以内)</p>
      <textarea name="text" id="" cols="40" rows="9" maxlength="200"></textarea>
    <input type="hidden" name="shopcode", value="{{ shopcode }}">
    <input type="hidden" name="shopname", value="{{ shopname }}">
    <br>
    <input type="submit" value="投稿する" onclick="return confirm('この内容で投稿してよろしいですか?');" class="btn">
    <br>
  </form>
  <hr>
  <form action="/" method="GET">
    <input type="submit" value="地図に戻る" class="btn">
  </form>
</body>
</html>
