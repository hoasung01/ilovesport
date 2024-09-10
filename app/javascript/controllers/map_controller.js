import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    latitude: Number,
    longitude: Number,
    name: String
  }

  connect() {
    if (this.latitudeValue && this.longitudeValue) {
      const location = [this.latitudeValue, this.longitudeValue]
      const map = L.map(this.element).setView(location, 15)

      L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
      }).addTo(map)

      L.marker(location).addTo(map)
        .bindPopup(this.nameValue)
        .openPopup()
    } else {
      console.error("Latitude or Longitude is missing!")
    }
  }
}
