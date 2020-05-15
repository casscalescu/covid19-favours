export const initModal = () => {

  // Define UI variables
  const favourCards = document.querySelectorAll('.js-favour-card-index');
  const favourModal = document.querySelector('.js-modal');
  const modalContent = document.querySelector('.favour-modal__content');
  const closeModal = document.querySelector('.js-modal__close');
  const modalImage = favourModal.querySelector('.js-modal__image');
  const modalName = favourModal.querySelector('.js-modal__name');
  const modalAddress = favourModal.querySelector('.js-modal__address');
  const modalDate = favourModal.querySelector('.js-modal__date');
  const modalCategory = favourModal.querySelector('.js-modal__category');
  const modalTitle = favourModal.querySelector('.js-modal__title');
  const modalDescription = favourModal.querySelector('.js-modal__description');
  const modalButtons = favourModal.querySelector('.favour-modal__buttons');
  const modalViewFavour = favourModal.querySelector('.favour-modal__link');
  const modalButton = favourModal.querySelector('.favour-modal__button');

  // Load all event listeners
  loadEventListeners();

  // Event listeners
  function loadEventListeners() {
    favourCards.forEach((card) => {

      // Open modal
      card.addEventListener('click', (e) => {
        if(e.target === card.querySelector('.favour-card__button')) {
          return
        }
        toggleModal();
      })

      // Insert data into modal
      card.addEventListener('click', () => {
        modalImage.src = card.querySelector('.favour-card__avatar').src;
        modalName.innerText = card.dataset.favourName;
        modalAddress.innerText = card.dataset.favourAddress;
        modalDate.innerText = card.dataset.favourDate;
        modalCategory.innerText = card.dataset.favourCategory;
        modalTitle.innerText = card.dataset.favourTitle;
        modalDescription.innerText = card.dataset.favourDescription;

        // Clear category pill class
        removeCategoryClass();

        // Add category pill class
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

        // Clear buttons inner html
        clearButtons();

        // Add 'View Favour' link to modal
        const cardButton = card.querySelector('.favour-card__button');
        const cardMessage = card.querySelector('.favour-card__notice');
        // Create link element
        const link = document.createElement('a');
        // Add class
        link.className = 'link favour-modal__link';
        // Add text
        link.innerText = 'View Favour';
        // Add href
        link.setAttribute("href", card.dataset.favourLink);
        // Append link to div
        modalButtons.appendChild(link);

        // Add Button or Message to modal
        if(card.lastElementChild.classList.contains('favour-card__notice')) {
          // Create p element
          const message = document.createElement('p');
          // Add class
          message.className = 'favour-modal__notice';
          // Add text
          message.innerText = cardMessage.innerText;
          // Append modal to div
          modalButtons.appendChild(message);
        } else {
          // Create button element
          const button = document.createElement('a');
          // Add class
          button.className = 'button button--primary-fill favour-modal__button';
          // Add text
          button.innerText = cardButton.innerText;
          // Add href
          button.setAttribute("href", cardButton.href);
          // Append button to div
          modalButtons.appendChild(button);
        }
      })
    });

    // Close modal
    closeModal.addEventListener('click', toggleModal);
  }

  // Toggle modal and freeze body
  function toggleModal() {
    document.body.classList.toggle('body--freeze');
    favourModal.classList.toggle('favour-modal--hidden');
  }

  // Clear category pill classes
  function removeCategoryClass() {
    modalCategory.classList.remove('pill--outline-orange', 'pill--outline-light-blue', 'pill--outline-green', 'pill--outline-dark-blue', 'pill--outline-red', 'pill--outline-yellow');
  }

  // Clear buttons inner html
  function clearButtons() {
    while(modalButtons.firstChild) {
      modalButtons.removeChild(modalButtons.firstChild);
    }
  }
}
