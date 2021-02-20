// import the plugin
import places from 'places.js';

// create a function
const initAutocomplete = () => {
  const addressInput = document.getElementById('restaurant_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

// export the function
export { initAutocomplete };
