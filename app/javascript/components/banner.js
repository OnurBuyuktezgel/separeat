import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Let's go!", "Choose an option"],
    typeSpeed: 120,
    loop: true
  });
}

export { loadDynamicBannerText };
