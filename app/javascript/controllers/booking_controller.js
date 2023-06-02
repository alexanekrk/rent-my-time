import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["box"]

  connect() {
    // console.log("connetced")

  }


  box(event){
    console.log(event.currentTarget)
    console.dir(this.boxTarget)
  }
}
