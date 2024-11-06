import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "prediction", "button" ]

  show(data) {
    const prediction = this.predictionTarget
    const button = this.buttonTarget

    prediction.textContent = data.body
    button.textContent = "Спросить еще раз"
  }

  ask() {
    fetch(`/predictions/`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").getAttribute("content"),
      }
    })
    .then(response => response.json())
    .then(data => this.show(data))
    .catch(error => console.error("Error loading predictions:", error));
  }
}  
