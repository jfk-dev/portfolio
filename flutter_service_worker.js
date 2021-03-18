'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "manifest.json": "84a2d5be7c1f5e2aedcd3768eb97976b",
"icons/Icon-192.png": "83f05c02e74b8647be59aadc185f6dd5",
"icons/Icon-512.png": "bf339d3fdfa9ef3886676526ce6be437",
"assets/NOTICES": "55b7be6a2fea3fb9f71d88d5207b8ef7",
"assets/assets/fonts/Fira-Code/FiraCode-Medium.ttf": "e613bf534959b8c52533e77ea0cee44e",
"assets/assets/fonts/Fira-Code/FiraCode-Bold.ttf": "ea734aec73e961c5814b1b403c9b90c6",
"assets/assets/fonts/Fira-Code/FiraCode-Light.ttf": "137778879005023b427be30df1f57d83",
"assets/assets/fonts/Fira-Code/FiraCode-Regular.ttf": "1a77fe6d9f399212fcfcfde790ce66b2",
"assets/assets/fonts/Product-Sans/Product-Sans-Italic.ttf": "e88ec18827526928e71407a24937825a",
"assets/assets/fonts/Product-Sans/Product-Sans-Bold-Italic.ttf": "79750b1d82b2558801373d62dd7e5280",
"assets/assets/fonts/Product-Sans/Product-Sans-Bold.ttf": "dba0c688b8d5ee09a1e214aebd5d25e4",
"assets/assets/fonts/Product-Sans/Product-Sans-Regular.ttf": "eae9c18cee82a8a1a52e654911f8fe83",
"assets/assets/fonts/AppIcons/AppIcons.ttf": "336760a14cea820ab7e830b606516390",
"assets/assets/images/logo.png": "be76cd005c349058f5467f6db02e926e",
"assets/assets/images/profile_picture.png": "30c2eee3275881c6e9518e2c8e8ec286",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"assets/AssetManifest.json": "53a26a2c98cf9bf49e18b3f436bafbbe",
"assets/config.yaml": "d41d8cd98f00b204e9800998ecf8427e",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "9a62a954b81a1ad45a58b9bcea89b50b",
"assets/FontManifest.json": "07e3427b4fd6a4342b7e4a0134f43b17",
"index.html": "a550b0552eee81c4c493caa7cc5fe804",
"/": "a550b0552eee81c4c493caa7cc5fe804",
"main.dart.js": "88d19623ce9e2164aa8a923401d3a251",
"CNAME": "c7ef0f287cf047ae5fd02de3415fab05",
"version.json": "3bb6c18a962c0ceaf2e2d48929cf0913",
"favicon.png": "6d15f56b1da43113d3906761285d77dc"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value + '?revision=' + RESOURCES[value], {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
