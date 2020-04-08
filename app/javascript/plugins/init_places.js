import places from 'places.js';

const initLocationAutocomplete =  () => {
  new places({
    appId: 'plLDVOZWCU34',
    apiKey: '872ed1df1d846e4703f5d49240d9a1a0',
    container: document.querySelector('#address-input'),
    countries: ['au']
  });
  console.log("It works!");
}

export { initLocationAutocomplete }
