{% extends "base.html" %}
    {% block head %}
     {{ super() }}
    {% endblock %}
    {% block main %}
    <div id="header">
      <h3>◆ コロナ関連品 販売状況 春日井西部 ◆</h3>
      <span>情報の投稿、確認はマーカーをクリックして開いたウインドウから選択出来ます</span>
    </div>

    <div id="map"></div>
    <div id="usage">
      <p><strong>近所のお店の品切れ情報を共有しよう！</strong></p>
      <h3>● 使い方 </h3>
      <P class="text">Marker<img src="https://maps.gstatic.com/mapfiles/api-3/images/spotlight-poi2_hdpi.png" alt="Google Maps Marker Image" width=15>
        をクリック（タップ）して開いたウィンドウから「情報を入力する」か「投稿された情報を見る」を選んでください</P>
      <p class="usage">・情報を入力する</p>
      <p class="text">
        選択式入力欄からは最大１０品まで選択できます。</p>
      <p class="text">「品名」欄から商品の種類を選択し、その商品の「減り具合」を選択してください。商品名に重複がなければ商品の順番は問いません（間に空の欄があっても問題ありません）。</p>
      <p class="text"> より詳しい情報、その他の商品の情報等があれば「より詳細な情報やその他製品の情報」欄に200文字以内で入力してください。</p>
      <p class="usage">・投稿された情報を見る</p>
      <p class="text">投稿日時の新しい順に投稿された内容が並んでいます。スクロールして過去の情報を見ることもできます。</p>
      <p class="usage" id="delete-post">・投稿内容を削除するには？</p>
      <p>以下より選択し、開いたページで投稿番号とパスワード入力してください</p>
      <form action="/post_delete" method="GET">
        <input type="submit" value="品物情報を削除する" class="send">
      </form>
      <br>
      <form action="/opinion_delete" method="GET">
        <input type="submit" value="ご意見、ご感想を削除する" class="send">
      </form>
      <p>※ 削除には投稿後の画面で表示される投稿番号とパスワードが必要になります。</p>
      <h3>● このサイトのについて</h3>
      <p>除菌グッズやらインスタント麺やら･･･様々な商品が手に入りにくくなっている今日この頃。</p>
      <p>「店に来る前に品切れになっているって判っていれば･･･」なんて思ったことがある人も多いのでは？</p>
      <p>もし、あなたが買い物に行ったお店で品切れになっていた物を「近所の誰か」が知ることが出来れば、その「近所の誰か」は何軒もお店を探し回らずに済むかも知れません。</p>
      <p>そんなわけで、近所のお店の品物の減り具合の情報を投稿できるサイトを作ってみました<br>
        （勿論、「売っていたモノ」の情報を投稿して頂いてもOK）</p>
        <p>「近所の誰か」のために、是非情報の投稿をお願いします m(_ _)m</p>
        <hr>
      ご意見、ご感想はコチラ
      <form action="/opinions_and_impression" method="POST">
        <input type="hidden" name="time" value="" id=time>
        <input type="submit" value="ご意見、ご感想を投稿する" class="send">
      </form>

      <hr>
      <span id="disclimer">※免責事項: <br>サイト管理者は、本サイトの利用の結果生じた損害について、一切責任を負いません。投稿され、サイト上に表示された内容の真偽について、サイト製作者はなんら保証を致しません。それらの利用はあなたの自己責任で行う必要があります。</span>
    </div>
    <script>
    {
      'use strict';

    let map;

    // session管理用トークン生成に使う値
    let time = Date.now()
      const setTime = document.getElementById('time')
      setTime.value = time;

      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 35.2427162, lng: 136.9533993},
          styles: [
            {
              "featureType": "poi.school",
              "stylers": [
                { "visibility": "off" }
              ]
            },
            {
              "featureType": "poi",
              "stylers": [
                { "saturation": -100 }
              ]
            },
          ],
          zoom: 14
        });
        fetch('./static/data.json', {cache: "no-store"})
        .then(function(response){return response.json();})
        .then(putMarker);
      }

      function putMarker(data) {
        for (let code in data) {
          const infoContent =
          `<span><strong>${data[code].shopname}</strong></span><br/>
          <span>${data[code].opentime}</span><br/>
          <hr/>
          <span>最終更新: ${data[code].lastupdate}</span><br/>
          <span>住所: ${data[code].address}</span><br/>
          <span>Tel: ${data[code].tel}</span>
          <hr>
          <form action="/form" method="POST" accept-charset="UTF-8">
            <input type="hidden" name="shopcode" value="${code}">
            <input type="hidden" name="shopname" value="${data[code].shopname}">
            <input type="hidden" name="time" value="${time}" id="time">
            <input  class="btn" type="submit" value="情報を入力する">
          </form>
          <form action="/view" method="POST" accept-charset="UTF-8">
            <input type="hidden" name="shopcode" value="${code}"/>
            <input type="hidden" name="shopname" value="${data[code].shopname}">
            <input class="btn" type="submit" value="投稿された情報を見る">
          </form>`;

          const infowindow =new google.maps.InfoWindow({
            content: infoContent,
            maxWidth: 250
          });

          const marker = new google.maps.Marker({
            position: data[code].latlng,
            map: map,
            title: data[code].shopname.replace("&amp;", "&"),
          });

          marker.addListener('click', function() {
            infowindow.open(map, marker);
          });
        }
      }

    }

    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key={ Your API Key }&callback=initMap"
    async defer></script>
  {% endblock %}
