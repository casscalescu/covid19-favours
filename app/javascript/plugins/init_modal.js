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
        favourRecipientPhoto.src = favourCard.querySelector('.card-user-image').src
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


// export const initModal = () => {
//   // Create UI variables
//   const favourIndexModal = document.querySelector('.js-favour-index-modal');
//   if (!favourIndexModal){
//     return;
//   }
//   const modalContent = document.querySelector('.modal-content');
//   const favourModalClose = document.querySelector('.close-modal');
//   const favourIndexCards = document.querySelectorAll('.js-favour-index-card');
//   const favourRecipientPhoto = favourIndexModal.querySelector('.js-favour-recipient-photo');
//   const favourRecipientName = favourIndexModal.querySelector('.js-favour-recipient-name');
//   const favourCompletion = favourIndexModal.querySelector('.js-favour-completion');
//   const favourCategory = favourIndexModal.querySelector('.js-favour-category');
//   const favourTitle = favourIndexModal.querySelector('.js-favour-title');
//   const favourDescription = favourIndexModal.querySelector('.js-favour-description');

//   // Add event listeners
//   const attachListenersToFavourIndex = () => {
//     // Open modal
//     favourIndexCards.forEach((favourCard) => {
//       favourCard.addEventListener("click", () => {
//         favourIndexModal.style.display = 'flex';
//       })
//     })

//     // Close modal with button
//     favourModalClose.addEventListener("click", () => {
//       favourIndexModal.style.display = 'none';
//     })

//     // Close modal when clicking outside of modal
//     window.addEventListener("mouseup", (event) => {
//       if(event.target !== modalContent && event.target.parentNode !== modalContent){
//         favourIndexModal.style.display = 'none';
//       }
//     })


//     // Insert data onto modal
//     favourIndexCards.forEach((favourCard) => {
//       favourCard.addEventListener("click", () => {
//         favourRecipientPhoto.src = favourCard.querySelector('.card-user-image').src
//         favourRecipientName.innerText = favourCard.dataset.favourRecipientName
//         favourCompletion.innerText = favourCard.dataset.favourCompletion
//         favourCategory.innerText = favourCard.dataset.favourCategory
//         favourTitle.innerText = favourCard.dataset.favourTitle
//         favourDescription.innerText = favourCard.dataset.favourDescription
//       })
//     })
//   }
//   attachListenersToFavourIndex();
//   window.attachListenersToFavourIndex = attachListenersToFavourIndex;
// }
