const input = document.getElementById('address-input');
const options = {
  componentRestrictions: {country: 'au'}
};

const initGooglePlacesAutocomplete =  () => {
  new google.maps.places.Autocomplete(input, options);
}

export { initGooglePlacesAutocomplete }
