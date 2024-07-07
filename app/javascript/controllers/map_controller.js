import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/standard",
      center: [-24, 42], // Coordonnées initiales (seront mises à jour)
      zoom: 1 // Zoom initial
    })

    this.#addGeolocateControl()
    this.#centerMapOnUserLocation()
  }


  #addGeolocateControl() {
    const geolocate = new mapboxgl.GeolocateControl({
      positionOptions: {
        enableHighAccuracy: true
      },
      trackUserLocation: true,
      showUserHeading: true,
    })

    this.map.addControl(geolocate)

    this.map.on('load', () => {
      geolocate.trigger() // Active automatiquement la géolocalisation
    })


  }

  #centerMapOnUserLocation() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition((position) => {
        const { latitude, longitude } = position.coords
        this.map.setCenter([longitude, latitude])
        // this.map.setZoom(30) // Vous pouvez ajuster le niveau de zoom selon vos besoins
      }, (error) => {
        console.error("Error getting user location:", error)
      })
    } else {
      console.error("Geolocation is not supported by this browser.")
    }
  }
}
