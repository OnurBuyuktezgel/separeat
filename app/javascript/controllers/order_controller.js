import { Controller } from "stimulus"

export default class extends Controller {
  // your logic (controller actions)
  static targets = [ "content" ]

  connect() {
    // this.outputTarget.textContent = 'Added to your order!'
    console.log("connected:", this.contentTarget);
  }

  sayAdded() {
    this.contentTarget.innerHTML = `<p style="font-size: 32px; color: #ffcf3e"><i class="fas fa-check-circle"></i></p>`;
    document
    // setTimeout(function() {this.contentTarget.innerHTML = `<button class="btn-ghost added" data-action="click->order#sayAdded">+</button>`}, 3000);
  }
}
