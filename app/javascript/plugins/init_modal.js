export const initModal =  () => {
  // Create UI variables
  const favourCards = document.querySelectorAll('.js-favour-card-index');
  const favourModal = document.querySelector('.js-modal');
  const closeModal = document.querySelector('.js-modal__close');
  const modalImage = favourModal.querySelector('.js-modal__image');
  const modalName = favourModal.querySelector('.js-modal__name');
  const modalAddress = favourModal.querySelector('.js-modal__address');
  const modalDate = favourModal.querySelector('.js-modal__date');
  const modalCategory = favourModal.querySelector('.js-modal__category');
  const modalTitle = favourModal.querySelector('.js-modal__title');
  const modalDescription = favourModal.querySelector('.js-modal__description');
  const modalViewFavour = favourModal.querySelector('.favour-modal__link');
  const modalButton = favourModal.querySelector('.favour-modal__button');

  // Toggle modal
  const toggleModal = () => {
    favourModal.classList.toggle('favour-modal--hidden');
  }

  // Add event listeners
  const attachListeners = () => {

    // Open modal
    favourCards.forEach((card) => {
      card.addEventListener('click', toggleModal);



      // Insert data onto modal
      card.addEventListener('click', () => {
        modalImage.src = card.querySelector('.favour-card__avatar').src;
        modalName.innerText = card.dataset.favourName;
        modalAddress.innerText = card.dataset.favourAddress;
        modalDate.innerText = card.dataset.favourDate;
        modalCategory.innerText = card.dataset.favourCategory;
        modalTitle.innerText = card.dataset.favourTitle;
        modalDescription.innerText = card.dataset.favourDescription;

        // Modal buttons
        const cardButton = card.querySelector('.favour-card__button');

        if(card.lastElementChild.tagName.toLowerCase() === 'a') {
          modalViewFavour.href = card.dataset.favourLink;
          modalButton.href = cardButton.href;
          modalButton.innerText = cardButton.innerText;
        } else {
          const buttons = favourModal.querySelector('.favour-modal__buttons');
          // console.log(buttons);
        }



        // Clear pill category outline color
        modalCategory.classList.remove('pill--outline-orange', 'pill--outline-light-blue', 'pill--outline-green', 'pill--outline-dark-blue', 'pill--outline-red', 'pill--outline-yellow');

        // Add pill category outline colour
        switch (card.dataset.favourCategory) {
          case 'Groceries':
            modalCategory.classList.add("pill--outline-orange");
            break;
          case 'Pets':
            modalCategory.classList.add("pill--outline-light-blue");
            break;
          case 'Gardening':
            modalCategory.classList.add("pill--outline-green");
            break;
          case 'Medicine':
            modalCategory.classList.add("pill--outline-dark-blue");
            break;
          case 'Other':
            modalCategory.classList.add("pill--outline-red");
            break;
          case 'Friendly Chat':
            modalCategory.classList.add("pill--outline-yellow");
        }
      })
    });

    // Close modal
    closeModal.addEventListener('click', toggleModal);
  }
  attachListeners();
}
