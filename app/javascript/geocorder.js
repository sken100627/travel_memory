export function initMap() {
  const tower = { lat: destination.latitude, lng: destination.latitude };
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