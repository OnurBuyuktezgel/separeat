import { Controller } from "stimulus"

export default class extends Controller {
  // your logic (controller actions)
  static targets = [ "content" ]

  connect() {
    // this.outputTarget.textContent = 'Added to your order!'
    console.log("connected:", this.contentTarget);
  }

  sayAdded() {
    // setTimeout(function() {this.contentTarget.innerHTML = "Added ✔";}, 3000);
    this.contentTarget.innerHTML = "Added ✔";
  }
}
