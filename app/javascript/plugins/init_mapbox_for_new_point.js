import mapboxgl from '!mapbox-gl';

function buildMapNewPoint() {
  var coords;

  if (document.querySelector(".map-edit-point")) {
    const latitude = parseFloat(document.querySelector("input[id*='latitude']").value);
    const longitude = parseFloat(document.querySelector("input[id*='longitude']").value);
    coords = [longitude, latitude];
  } else {
    coords = [-56, -15];
  }

  mapboxgl.accessToken = 'pk.eyJ1IjoicGpmZXJuYW5kZXMiLCJhIjoiY2t1c291Z3lzNWg2bzJvbW5kNWNhbnZhaCJ9.eYxvagOUGuS5qDo-zOfRCA';

  if (document.getElementById("new_point") || document.getElementById("map-new-point")) {
    let map = new mapboxgl.Map({
      container: 'map-new-point',
      style: "mapbox://styles/mapbox/satellite-v9",
      center: coords,
      zoom: 2
    });

    var el = document.createElement('div');
    el.id = 'marker';

    var marker = new mapboxgl.Marker();
    marker
      .setLngLat(coords)
      .addTo(map);

    function add_marker(event) {
      marker.remove()
      var coordinates = event.lngLat;
      if (document.getElementById("sediment_longitude")) {
        document.getElementById("sediment_longitude").value = coordinates.lng;
        document.getElementById("sediment_latitude").value = coordinates.lat;
      }

      if (document.getElementById("water_longitude")) {
        document.getElementById("water_longitude").value = coordinates.lng;
        document.getElementById("water_latitude").value = coordinates.lat;
      }

      if (document.getElementById("gase_longitude")) {
        document.getElementById("gase_longitude").value = coordinates.lng;
        document.getElementById("gase_latitude").value = coordinates.lat;
      }

      marker.remove().setLngLat(coordinates).addTo(map);
    }

    map.on('click', add_marker);
    return map;
  }
}

export { buildMapNewPoint };
