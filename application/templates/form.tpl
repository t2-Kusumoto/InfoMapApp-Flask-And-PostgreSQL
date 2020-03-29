<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Input form</title>
  <style>
  h2 {
    margin: 0
  }
    span {
      display: inline-block;
      margin-top: 0.5em;
    }
  </style>
</head>
<body>
  <h2>{{ shopname }}の情報</h2>
  <span>※正確な情報の提供をお願いします</span>
  <hr>
  <form action="/insert_info" method="POST" accept-charset="UTF-8">
    <span>マスク</span><br>
    <input type="radio" name="mask" value="green" id="g">
    <label for="g">あり</label>
    <input type="radio" name="mask" value="yellow" id="y">
    <label for="y">残り僅か</label>
    <input type="radio" name="mask" value="red" id="r">
    <label for="">なし</label>
    <input type="radio" name="mask" value="white" id="w" checked>
    <label for="w"></label>分からない
      <br>
    <span>トイレットペーパー</span><br>
    <input type="radio" name="paper" value="green" id="g">
    <label for="g">あり</label>
    <input type="radio" name="paper" value="yellow" id="y">
    <label for="y">残り僅か</label>
    <input type="radio" name="paper" value="red" id="r">
    <label for="">なし</label>
    <input type="radio" name="paper" value="white" id="w" checked>
    <label for="w"></label>分からない
      <br>
    <span>消毒液</span><br>
    <input type="radio" name="liquied" value="green" id="g">
    <label for="g">あり</label>
    <input type="radio" name="liquied" value="yellow" id="y">
    <label for="y">残り僅か</label>
    <input type="radio" name="liquied" value="red" id="r">
    <label for="">なし</label>
    <input type="radio" name="liquied" value="white" id="w" checked>
    <label for="w"></label>分からない
      <br>
    <span>除菌シート</span><br>
    <input type="radio" name="sheet" value="green" id="g">
    <label for="g">あり</label>
    <input type="radio" name="sheet" value="yellow" id="y">
    <label for="y">残り僅か</label>
    <input type="radio" name="sheet" value="red" id="r">
    <label for="">なし</label>
    <input type="radio" name="sheet" value="white" id="w" checked>
    <label for="w"></label>分からない
      <br>
    <p>その他の情報(200文字以内)</p>
      <textarea name="text" id="" cols="45" rows="9" maxlength="200"></textarea>
    <input type="hidden" name="shopcode", value="{{ shopcode }}">
    <input type="hidden" name="shopname", value="{{ shopname }}">
    <input type="submit" value="情報を投稿する" onclick="return confirm('この内容で登録してよろしいですか?');">
  </form>
  <a href="/">&lt;地図に戻る</a>
</body>
</html>
