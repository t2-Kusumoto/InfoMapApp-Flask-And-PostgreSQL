{
  'use strict';

  const SIZE = 11;

  function initFunc() {
    /*
      選択式入力欄の生成
      実際に記述しても良いが、ファイルがごちゃごちゃするのが嫌だったのでこの方法
    */
    const form = document.getElementById('form');
    const container = document.getElementById('container');

    let contents = "";

    for (let i = 1; i < SIZE; i++) {
      let content = `<div class="box">
      <span><strong>No.${i} </strong></span>
      <br>
      <span>品名: </span>
      <select name="no-${i}" class="products">
      <option value="">選択してください</option>
      <option value="mask">マスク</option>
      <option value="wet">ウエットティッシュ</option>
      <option value="soap">薬用ハンドソープ</option>
      <option value="paper">キッチンペーパー</option>
      <option value="liquid">消毒液類</option>
      <option value="noodles">インスタント麺</option>
      <option value="pasta">パスタ</option>
      <option value="sorce">パスタソース</option>
      <option value="flour">ホットケーキミックス</option>
      <option value="snack">袋入りお菓子</option>
      </select>
      <br>
      <label for="full" class="radio">少なくなってる</label>
      <input type="radio" name="no${i}" value="full" id="full">
      <label for="finieshed" class="radio">品切れ</label>
      <input type="radio" name="no${i}" value="finished" id="finished">
      <br>
      <label for="few" class="radio">種類が限られる</label>
      <input type="radio" name="no${i}" value="few" id="few">
      <label for="unknown" class="radio">分からない</label>
      <input type="radio" name="no${i}" value="unknown" id="unknown" checked>
      <hr>
      </div>`
      contents += content;
    }
    container.innerHTML = contents;
  }

  window.onload = () => {
      initFunc();
  }

  function replaceEmptyStr(elements) {
    /*
    品名が選択されず(「選択してください」のままで)、値が "" となるものは
    重複とは判断させないように、数値(count)に置き換える
    */
    let count = 0;
    const elemList = []
    for (let i = 0; i < elements.length; i++) {
      if (!elements[i].value) {
        elemList.push(count)
        count++
      } else {
        elemList.push(elements[i].value)
      }
    }
    if (count === elements.length) {
      return false
    } else {
      return elemList
    }
  }

  const btn = document.getElementById('btn');

  btn.addEventListener('click', (e) => {
    /*
    選択項目が、選択されていない or 選択内容に重複がある場合
    フォームの送信をせず、アラートを出す。
    */
      const elements = document.getElementsByClassName('products');
      const elemList = replaceEmptyStr(elements)
      if (!elemList) {
        alert('「品名」が選択されていません');
        e.preventDefault();
        return;
      }
      const value_set = new Set();
      for (let i = 0; i < elemList.length; i++) {
        value_set.add(elemList[i]);
      }
      if (elemList.length !== value_set.size) {
        alert('同じ「品名」が選択されています');
        e.preventDefault();
        return;
      }
  });
}
