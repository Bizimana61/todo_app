// Register Service Worker for PWA
if ('serviceWorker' in navigator) {
  window.addEventListener('load', () => {
    navigator.serviceWorker
      .register('/service-worker.js')
      .then((registration) => {
        console.log('ServiceWorker registered:', registration);
        
        // Check for updates
        registration.addEventListener('updatefound', () => {
          const newWorker = registration.installing;
          newWorker.addEventListener('statechange', () => {
            if (newWorker.state === 'installed' && navigator.serviceWorker.controller) {
              // New service worker available, show update notification
              if (confirm('A new version is available! Reload to update?')) {
                window.location.reload();
              }
            }
          });
        });
      })
      .catch((error) => {
        console.log('ServiceWorker registration failed:', error);
      });
  });
}

// Handle app install prompt
let deferredPrompt;

window.addEventListener('beforeinstallprompt', (e) => {
  // Prevent the mini-infobar from appearing on mobile
  e.preventDefault();
  // Stash the event so it can be triggered later
  deferredPrompt = e;
  
  // Show install button (you can create a custom install button)
  console.log('App can be installed');
  
  // Optional: Show your custom install button
  const installButton = document.getElementById('install-button');
  if (installButton) {
    installButton.style.display = 'block';
    installButton.addEventListener('click', async () => {
      installButton.style.display = 'none';
      deferredPrompt.prompt();
      const { outcome } = await deferredPrompt.userChoice;
      console.log(`User response to install prompt: ${outcome}`);
      deferredPrompt = null;
    });
  }
});

// Track installation
window.addEventListener('appinstalled', () => {
  console.log('PWA was installed');
  deferredPrompt = null;
});

// Handle iOS standalone mode
if (window.navigator.standalone === true) {
  console.log('Running in iOS standalone mode');
}

// Check if running as PWA
const isPWA = () => {
  return (
    window.matchMedia('(display-mode: standalone)').matches ||
    window.navigator.standalone === true
  );
};

if (isPWA()) {
  console.log('Running as PWA');
  document.body.classList.add('pwa-mode');
}
