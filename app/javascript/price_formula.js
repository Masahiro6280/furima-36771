function calc (){
  // id="item-placeの要素を取得。
  const itemPlace = document.getElementById("item-price");
  // 値が入力された時にイベントを発火。
  itemPlace.addEventListener('input', function(){
    // 下記を追記して、要素の値を取得。
    const itemPlaceValue = itemPlace.value
    const Tax = 0.1;
    const tax_fee = itemPlaceValue * Tax;
    const profit = itemPlaceValue - tax_fee;
    const taxArea = document.getElementById("add-tax-price");
    const profitArea = document.getElementById("profit");
    taxArea.innerHTML = tax_fee;
    profitArea.innerHTML = profit;
  })
}

window.addEventListener('load', calc)