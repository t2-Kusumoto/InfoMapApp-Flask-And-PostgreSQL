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

  .send {
    width: 220px;
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
  <h3>◆ <u>{{ shopname }}</u> ◆</h3>
  <span>※正確な情報の提供をお願いします</span>
  <hr>
  <form action="/insert_info" method="POST" accept-charset="UTF-8" name="reset">
    <input type="hidden" name="time" value="{{ time }}" id="time">
    <span>● マスク</span><br>
    <input type="radio" name="mask" value="green" id="g">
    <label for="g">あり</label>
    <input type="radio" name="mask" value="yellow" id="y">
    <label for="y">少ない</label>
    <input type="radio" name="mask" value="red" id="r">
    <label for="r">なし</label>
    <input type="radio" name="mask" value="white" id="w" checked>
    <label for="w">分からない</label>
      <br>
    <span>● ウエットティッシュ</span><br>
    <input type="radio" name="wet" value="green" id="g">
    <label for="g">あり</label>
    <input type="radio" name="wet" value="yellow" id="y">
    <label for="y">少ない</label>
    <input type="radio" name="wet" value="red" id="r">
    <label for="r">なし</label>
    <input type="radio" name="wet" value="white" id="w" checked>
    <label for="w">分からない</label>
      <br>
    <span>● ハンドソープ</span><br>
    <input type="radio" name="soap" value="green" id="g">
    <label for="g">あり</label>
    <input type="radio" name="soap" value="yellow" id="y">
    <label for="y">少ない</label>
    <input type="radio" name="soap" value="red" id="r">
    <label for="r">なし</label>
    <input type="radio" name="soap" value="white" id="w" checked>
    <label for="w">分からない</label>
      <br>
    <span>● ミネラルウォーター</span><br>
    <input type="radio" name="water" value="green" id="g">
    <label for="g">あり</label>
    <input type="radio" name="water" value="yellow" id="y">
    <label for="y">少ない</label>
    <input type="radio" name="water" value="red" id="r">
    <label for="r">なし</label>
    <input type="radio" name="water" value="white" id="w" checked>
    <label for="w">分からない</label>
      <br>
    <span>● お米</span><br>
    <input type="radio" name="rice" value="green" id="g">
    <label for="g">あり</label>
    <input type="radio" name="rice" value="yellow" id="y">
    <label for="y">少ない</label>
    <input type="radio" name="rice" value="red" id="r">
    <label for="r">なし</label>
    <input type="radio" name="rice" value="white" id="w" checked>
    <label for="w">分からない</label>
      <br>
    <span>● インスタント麺</span><br>
    <input type="radio" name="noodles" value="green" id="g">
    <label for="g">あり</label>
    <input type="radio" name="noodles" value="yellow" id="y">
    <label for="y">少ない</label>
    <input type="radio" name="noodles" value="red" id="r">
    <label for="r">なし</label>
    <input type="radio" name="noodles" value="white" id="w" checked>
    <label for="w">分からない</label>
      <br>
    <span>● パスタ類</span><br>
    <input type="radio" name="pasta" value="green" id="g">
    <label for="g">あり</label>
    <input type="radio" name="pasta" value="yellow" id="y">
    <label for="y">少ない</label>
    <input type="radio" name="pasta" value="red" id="r">
    <label for="r">なし</label>
    <input type="radio" name="pasta" value="white" id="w" checked>
    <label for="w">分からない</label>
      <br>
    <p>・ その他の商品の情報<br>(200文字以内)</p>
      <textarea name="text" id="" cols="40" rows="9" maxlength="200"></textarea>
    <input type="hidden" name="shopcode", value="{{ shopcode }}">
    <input type="hidden" name="shopname", value="{{ shopname }}">
    <br>
    <input type="submit" value="投稿する" onclick="return confirm('この内容で投稿してよろしいですか?');" class="send">
    <br>
  </form>
  <hr>
  <form action="/" method="GET">
    <input type="submit" value="地図に戻る" class="send">
  </form>

<script>
// window.onload = () => {
//   document.reset.reset();
// }
</script>
</body>
</html>
