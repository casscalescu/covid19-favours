export const initModal = () => {

  // Define UI variables
  const favourCards = document.querySelectorAll('.js-favour-card-index');
  const favourModal = document.querySelector('.js-modal');
  const modalContent = document.querySelector('.favour-modal__content');
  const closeModal = document.querySelector('.js-modal__close');
  const modalImage = document.querySelector('.js-modal__image');
  const modalName = document.querySelector('.js-modal__name');
  const modalAddress = document.querySelector('.js-modal__address');
  const modalDate = document.querySelector('.js-modal__date');
  const modalCategory = document.querySelector('.js-modal__category');
  const modalTitle = document.querySelector('.js-modal__title');
  const modalDescription = document.querySelector('.js-modal__description');
  const modalButtons = document.querySelector('.favour-modal__buttons');
  const modalViewFavour = document.querySelector('.favour-modal__link');
  const modalButton = document.querySelector('.favour-modal__button');

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
        const link = document.createElement('a');
        link.className = 'link favour-modal__link';
        link.innerText = 'View Favour';
        link.setAttribute("href", card.dataset.favourLink);
        modalButtons.appendChild(link);

        // Add Button or Message to modal
        if(card.lastElementChild.classList.contains('favour-card__notice')) {
          const message = document.createElement('p');
          message.className = 'favour-modal__notice';
          message.innerText = cardMessage.innerText;
          modalButtons.appendChild(message);
        } else {
          const button = document.createElement('a');
          button.className = 'button button--primary-fill favour-modal__button';
          button.innerText = cardButton.innerText;
          button.setAttribute("href", cardButton.href);
          modalButtons.appendChild(button);
        }
      })
    });

    // Close modal
    closeModal && closeModal.addEventListener('click', toggleModal);
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
