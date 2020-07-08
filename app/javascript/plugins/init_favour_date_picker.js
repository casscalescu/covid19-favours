const inputs = document.querySelectorAll('.form__input-asap');
const not_asap = document.querySelector('#favour_completion_asap_false');
const date = document.querySelector('.js-date-input');

const revealDatePicker = (e) => {
  if(not_asap.checked) {
    date.classList.add('js-date-input__show');
  } else {
    date.classList.remove('js-date-input__show');
  }
}

const initFavourDatePicker = () => {
  inputs.forEach((input) => {
    input.addEventListener('change', (revealDatePicker));
  });
}

export { initFavourDatePicker }
