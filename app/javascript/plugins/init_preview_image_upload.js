const name = document.querySelector('.form__upload-file-name');
const input = document.querySelector('.form__upload-input');
const label = document.querySelector('.form__upload-label');
const imgPreview = document.querySelector('.form__upload-image-preview');

const previewImage = (e) => {
  if(e.target.files[0]) {
    label.classList.remove('form__upload-label--smiley');
    label.classList.add('button', 'form__upload-label--change-button');
    label.innerHTML = "Change Photo";
    imgPreview.src = URL.createObjectURL(e.target.files[0]);
    imgPreview.style.display = 'block';
    name.innerText = `Photo uploaded: ${e.target.files[0].name}`;
  }
}

const initImagePreview = () => {
  input && input.addEventListener('change', (previewImage));
}

export { initImagePreview }
