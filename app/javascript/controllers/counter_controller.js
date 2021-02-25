import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'count' ];

  refresh() {
    fetch('/orders', { headers: { accept: 'application/json' } })
      .then(response => response.json())
      .then((data) => {
        this.countTarget.innerText = data.orders.length;
      });
  }
}
