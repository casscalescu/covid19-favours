import places from 'places.js';

const initLocationAutocomplete =  () => {
  new places({
    container: document.querySelector('#address-input'),
    countries: ['au']
  });
  console.log("It works!");
}

export { initLocationAutocomplete }
