export function initMap() {
  const tower = { lat: 35.6586, lng: 139.7454 }; // 東京タワーを指定
  const map = new google.maps.Map(document.getElementById("map"), {
    zoom: 18,
    center: tower,
  });
  const marker = new google.maps.Marker({
    position: tower,
    map: map,
  });
}

window.initMap = initMap