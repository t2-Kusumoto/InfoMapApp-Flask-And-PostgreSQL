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
  <h2>{{ shopcode }}の情報</h2>
  <span>※正確な情報の提供をお願いします</span>
  <hr>
  <form action="/" methods="GET">
    <span>マスク</span><br>
    <input type="radio" name="mask" value="green">あり
    <input type="radio" name="mask" value="yellow">残り僅か
    <input type="radio" name="mask" value="red">なし
    <input type="radio" name="mask" value="gray" checked>分からない
      <br>
    <span>トイレットペーパー</span><br>
    <input type="radio" name="paper" value="green">あり
    <input type="radio" name="paper" value="yellow">残り僅か
    <input type="radio" name="paper" value="red">なし
    <input type="radio" name="paper" value="gray" checked>分からない
      <br>
    <span>消毒液</span><br>
    <input type="radio" name="liquid" value="green">あり
    <input type="radio" name="liquid" value="yellow">残り僅か
    <input type="radio" name="liquid" value="red">なし
    <input type="radio" name="paper" value="gray" checked>分からない
      <br>
    <span>除菌シート</span><br>
    <input type="radio" name="liquid" value="green">あり
    <input type="radio" name="liquid" value="yellow">残り僅か
    <input type="radio" name="liquid" value="red">なし
    <input type="radio" name="liquid" value="gray" checked>分からない
      <br>
    <p>その他の情報(200文字以内)</p>
      <textarea name="text" id="" cols="45" rows="9" maxlength="200"></textarea>
    <input type="hidden" name="shopcode", value="{{ shopcode }}">
    <input type="submit" value="情報を投稿する" onclick="return confirm('この内容で登録してよろしいですか?');">
  </form>
  <a href="/">&lt;地図に戻る</a>
</body>
</html>
