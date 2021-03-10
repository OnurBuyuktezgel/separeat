import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  const banner = document.querySelector("#banner-typed-text");
  if (banner) {
    new Typed('#banner-typed-text', {
      strings: ["Welcome to SeparEAT!", "Scan the QR code", "Order your food", "Pay online", "#Stay healthy!"],
      typeSpeed: 75,
      loop: true,
      fadeOut: true,
      fadeOutClass: 'typed-fade-out',
      fadeOutDelay: 500,
    });
  }
}

export { loadDynamicBannerText };

