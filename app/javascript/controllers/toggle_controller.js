import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  static targets = ["togglableElement"]
  connect() {
    console.log("Form controller connected")
  }
    fire() {
    this.togglableElementTarget.classList.toggle("d-none");
  }
}
