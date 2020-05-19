import "bootstrap";
import { initDashboardTabs } from '../plugins/init_dashboard_tabs.js';

// import { initGooglePlacesAutocomplete } from '../plugins/init_google_places.js';
import { initModal } from '../plugins/init_modal.js';

import { initImagePreview } from '../plugins/init_preview_image_upload.js';

// initGooglePlacesAutocomplete();

initDashboardTabs();

initImagePreview();

initModal();

