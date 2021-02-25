// 1) import the plugin
var $ = require( "jquery" )
require("slick-carousel")

// 2) create the function and put everything in it

const initSlick = () => {
  const carousel = document.querySelector(".multiple-items");
  if (carousel) {
    $('.multiple-items').slick({
      infinite: false,
      slidesToShow: 3,
      slidesToScroll: 3,
      arrows: true,
      variableWidth: false,
    });
  };
}

// 3) export the function

export { initSlick };
