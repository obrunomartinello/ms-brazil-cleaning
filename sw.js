const CACHE_NAME = 'ms-brazil-v2';
const urlsToCache = [
  './',
  './index.html',
  './styles.css',
  './script.js',
  './manifest.json',
  './assets/images/logo-white.png',
  './assets/images/logo-dark.png',
  './assets/images/IMG_2539.webp'
];

// Install: pre-cache critical assets
self.addEventListener('install', (event) => {
  self.skipWaiting(); // Activate new SW immediately
  event.waitUntil(
    caches.open(CACHE_NAME).then((cache) => cache.addAll(urlsToCache))
  );
});

// Activate: delete old caches
self.addEventListener('activate', (event) => {
  event.waitUntil(
    caches.keys().then((cacheNames) => {
      return Promise.all(
        cacheNames
          .filter((name) => name !== CACHE_NAME)
          .map((name) => caches.delete(name))
      );
    }).then(() => self.clients.claim()) // Take control of all pages immediately
  );
});

// Fetch: Network-first for HTML/CSS/JS, Cache-first for images
self.addEventListener('fetch', (event) => {
  const url = new URL(event.request.url);

  // For navigation requests and core assets (HTML, CSS, JS) → Network first
  if (
    event.request.mode === 'navigate' ||
    url.pathname.endsWith('.html') ||
    url.pathname.endsWith('.css') ||
    url.pathname.endsWith('.js')
  ) {
    event.respondWith(
      fetch(event.request)
        .then((response) => {
          // Clone and update cache with fresh version
          const responseClone = response.clone();
          caches.open(CACHE_NAME).then((cache) => cache.put(event.request, responseClone));
          return response;
        })
        .catch(() => caches.match(event.request)) // Fallback to cache if offline
    );
    return;
  }

  // For images and other assets → Cache first (they don't change often)
  event.respondWith(
    caches.match(event.request).then((response) => {
      return response || fetch(event.request).then((fetchResponse) => {
        const responseClone = fetchResponse.clone();
        caches.open(CACHE_NAME).then((cache) => cache.put(event.request, responseClone));
        return fetchResponse;
      });
    })
  );
});
