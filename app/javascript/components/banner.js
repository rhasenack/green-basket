import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Bridging the gap between heatlhy people and healthy food"],
    typeSpeed: 50,
    loop: true

  });
}

export { loadDynamicBannerText };
