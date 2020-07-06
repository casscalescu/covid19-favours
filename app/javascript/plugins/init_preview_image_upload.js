const name = document.querySelector('.form__file-name');
const input = document.querySelector('.form__input-file');
const label = document.querySelector('.form__label-file');
const imgPreview = document.querySelector('.form__image-preview');

const previewImage = (e) => {
  if(e.target.files[0]) {
    label.classList.remove('form__label-file--smiley');
    label.classList.add('button', 'form__label-file--change-button');
    label.innerHTML = "Change Photo";
    imgPreview.src = URL.createObjectURL(e.target.files[0]);
    imgPreview.style.display = 'block';
    name.innerText = `${e.target.files[0].name}`;
  }
}

const initImagePreview = () => {
  input && input.addEventListener('change', (previewImage));
}

export { initImagePreview }
