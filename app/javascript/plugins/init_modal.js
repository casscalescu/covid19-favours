export const initModal =  () => {
  // Create UI variables
  const favourIndexModal = document.querySelector('.js-favour-index-modal');
  if (!favourIndexModal){
    return;
  }
  const favourIndexCards = document.querySelectorAll('.js-favour-index-card');
  const favourRecipientPhoto = favourIndexModal.querySelector('.js-favour-recipient-photo');
  const favourRecipientName = favourIndexModal.querySelector('.js-favour-recipient-name');
  const favourCompletion = favourIndexModal.querySelector('.js-favour-completion');
  const favourCategory = favourIndexModal.querySelector('.js-favour-category');
  const favourTitle = favourIndexModal.querySelector('.js-favour-title');
  const favourDescription = favourIndexModal.querySelector('.js-favour-description');

  // Add event listeners
  const attachListenersToFavourIndex = () => {
    // Insert data onto modal
    favourIndexCards.forEach((favourCard) => {
      favourCard.addEventListener("click", () => {
        // favourRecipientPhoto.src = favourCard.querySelector('.card-user-image').src
        favourRecipientName.innerText = favourCard.dataset.favourRecipientName
        favourCompletion.innerText = favourCard.dataset.favourCompletion
        favourCategory.innerText = favourCard.dataset.favourCategory
        favourTitle.innerText = favourCard.dataset.favourTitle
        favourDescription.innerText = favourCard.dataset.favourDescription
      })
    })
  }
  attachListenersToFavourIndex();
  window.attachListenersToFavourIndex = attachListenersToFavourIndex;
}
