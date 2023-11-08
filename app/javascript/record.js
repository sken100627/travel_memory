function updateTotal() {
  const accommodationFee = parseFloat(document.getElementById("accommodation").querySelector("input").value) || 0;
  const gasolineFee = parseFloat(document.getElementById("gasoline").querySelector("input").value) || 0;
  const foodFee = parseFloat(document.getElementById("food").querySelector("input").value) || 0;
  const expressFee = parseFloat(document.getElementById("express").querySelector("input").value) || 0;
  const totalValue = accommodationFee + gasolineFee + foodFee + expressFee;
  document.getElementById("total-value").textContent = totalValue;
}

document.addEventListener("turbo:load", function() {
  updateTotal();
  
  // 各入力フィールドに対してinputイベントリスナーを追加
  document.getElementById("accommodation").querySelector("input").addEventListener("input", updateTotal);
  document.getElementById("gasoline").querySelector("input").addEventListener("input", updateTotal);
  document.getElementById("food").querySelector("input").addEventListener("input", updateTotal);
  document.getElementById("express").querySelector("input").addEventListener("input", updateTotal);
});
