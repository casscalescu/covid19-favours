export const initModal =  () => {
  // Create UI variables
  const favourCards = document.querySelectorAll('.js-favour-card-index');
  const favourModal = document.querySelector('.js-modal');
  const closeModal = document.querySelector('.js-modal__close');
  const modalName = favourModal.querySelector('.js-modal__name');
  const modalAddress = favourModal.querySelector('.js-modal__address');
  const modalDate = favourModal.querySelector('.js-modal__date');
  const modalCategory = favourModal.querySelector('.js-modal__category');
  const modalTitle = favourModal.querySelector('.js-modal__title');
  const modalDescription = favourModal.querySelector('.js-modal__description');


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
        modalName.innerText = card.dataset.favourName;
        modalAddress.innerText = card.dataset.favourAddress;
        modalDate.innerText = card.dataset.favourDate;
        modalCategory.innerText = card.dataset.favourCategory;
        modalTitle.innerText = card.dataset.favourTitle;
        modalDescription.innerText = card.dataset.favourDescription;

        // Change pill category colour
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
    })

    // Close modal
    closeModal.addEventListener('click', toggleModal);
  }
  attachListeners();
}
