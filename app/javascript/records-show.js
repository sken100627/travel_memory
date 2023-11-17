document.addEventListener('DOMContentLoaded', function() {
  recordTotal();
});

function recordTotal() {
  var accommodationFee = parseFloat(document.getElementById('accommodation_fee').innerText) || 0;
  var gasolineFee = parseFloat(document.getElementById('gasoline_fee').innerText) || 0;
  var foodFee = parseFloat(document.getElementById('food_fee').innerText) || 0;
  var expressFee = parseFloat(document.getElementById('express_fee').innerText) || 0;

  var total = accommodationFee + gasolineFee + foodFee + expressFee;
  document.getElementById('total').innerText = total;
}
window.addEventListener('turbo:load', records-show);