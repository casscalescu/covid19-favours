
// Create UI Variables
const tabs = document.querySelectorAll('.tab-label');
const tabContents = document.querySelectorAll('.tab-content');

// Do something on click (add/remove active class)
function changeTab(e) {
  // Add/remove active class from labels
  tabs.forEach((tab) => {
    if(tab.dataset.tabId === e.target.dataset.tabId) {
      tab.classList.add('active');
    } else {
      tab.classList.remove('active');
    }
  });

  // Add/remove active class from content
  tabContents.forEach((content) => {
    if(content.dataset.tabId === e.target.dataset.tabId) {
      content.classList.add('active');
    } else {
      content.classList.remove('active');
    }
  });
}

const initDashboardTabs =  () => {
  // Add listener to all tabs
  tabs.forEach((tab) => {
    tab.addEventListener('click', (changeTab));
  });
}

export { initDashboardTabs }
