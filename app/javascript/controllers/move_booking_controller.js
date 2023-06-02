import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="move-booking"
export default class extends Controller {
  static targets = [ 'link', 'destination' ]

  connect() {
    console.log("CONNECTED");
  }

  move(event) {
    // console.log(event);
    link = this.linkTarget
    destination = this.destinationTarget;
    destination.appendChild(link)

  }

}
