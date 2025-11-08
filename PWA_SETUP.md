# TaskManager PWA Setup Guide

## Overview
TaskManager is now a fully functional Progressive Web App (PWA) that can be installed on iOS, Android, and desktop devices.

## Features

### ✅ Installable
- Works on iOS (Safari)
- Works on Android (Chrome, Edge, Samsung Internet)
- Works on Desktop (Chrome, Edge, Opera)

### ✅ Offline Support
- Service Worker caches key pages and assets
- Works offline after first visit
- Network-first strategy for fresh content

### ✅ Native App Experience
- Standalone display mode (no browser UI)
- Splash screen on iOS and Android
- App icon on home screen
- Push notification support (ready for implementation)

### ✅ iOS Optimization
- Safe area insets for notch/Dynamic Island
- Status bar styling
- Apple-specific meta tags
- Proper touch icons

### ✅ Android Optimization
- Maskable icons support
- Theme color integration
- App shortcuts
- Chrome install banner

## Installation Instructions

### For Users

#### iOS (iPhone/iPad)
1. Open Safari and navigate to your app URL
2. Tap the Share button (square with arrow)
3. Scroll down and tap "Add to Home Screen"
4. Name it "TaskManager" and tap "Add"
5. App will appear on your home screen

#### Android
1. Open Chrome and navigate to your app URL
2. Tap the menu (three dots)
3. Tap "Add to Home Screen" or "Install app"
4. Confirm the installation
5. App will appear in your app drawer

#### Desktop (Chrome/Edge)
1. Open your app URL in Chrome or Edge
2. Look for install icon in address bar
3. Click "Install" when prompted
4. App will open in its own window

## Setup Requirements

### 1. Create PNG Icons

You need to create actual PNG icons (currently placeholders):

```bash
# Create 192x192 icon
# Use your design tool (Figma, Photoshop, etc.) to export:
# public/icon-192.png (192x192 pixels)

# Create 512x512 icon
# public/icon-512.png (512x512 pixels)
```

**Icon Requirements:**
- 192x192: Minimum size for Android
- 512x512: Required for Android splash screen
- Transparent background OR solid background
- PNG format
- Include padding (safe zone) for maskable icons

### 2. Test PWA

Use these tools to validate your PWA:

```bash
# Chrome DevTools
# 1. Open DevTools (F12)
# 2. Go to "Application" tab
# 3. Check "Manifest" section
# 4. Check "Service Workers" section
# 5. Use "Lighthouse" tab to run PWA audit

# Online tools:
# - https://www.pwabuilder.com/
# - Chrome DevTools Lighthouse
```

### 3. Production Checklist

Before deploying to production:

- [ ] Replace placeholder PNG icons with real ones
- [ ] Test install flow on iOS Safari
- [ ] Test install flow on Android Chrome
- [ ] Test offline functionality
- [ ] Verify service worker registration
- [ ] Check manifest.json loads correctly
- [ ] Test safe area insets on iOS devices with notch
- [ ] Verify theme color matches brand
- [ ] Test app shortcuts (Android)

## Configuration Files

### Manifest (`app/views/pwa/manifest.json.erb`)
- App name, description, icons
- Display mode (standalone)
- Theme colors
- App shortcuts

### Service Worker (`app/views/pwa/service-worker.js`)
- Caching strategy
- Offline support
- Push notifications
- Update handling

### PWA JavaScript (`app/javascript/pwa.js`)
- Service worker registration
- Install prompt handling
- PWA detection
- Update notifications

## Customization

### Change Theme Color
Edit `app/views/pwa/manifest.json.erb`:
```json
"theme_color": "#2563eb",  // Your brand color
"background_color": "#ffffff"
```

### Add More Shortcuts
Edit `app/views/pwa/manifest.json.erb`:
```json
"shortcuts": [
  {
    "name": "Create Todo",
    "url": "/todos/new",
    "icons": []
  }
]
```

### Customize Caching
Edit `app/views/pwa/service-worker.js`:
```javascript
const PRECACHE_ASSETS = [
  '/',
  '/todos',
  // Add more URLs to cache
];
```

## Troubleshooting

### PWA Not Installing on iOS
- Ensure using Safari (not Chrome/Firefox)
- Check manifest.json loads (visit /manifest.json)
- Verify icons are correct size
- Clear Safari cache and try again

### Service Worker Not Registering
- Check browser console for errors
- Ensure HTTPS (required for service workers)
- Verify /service-worker.js is accessible
- Check routes.rb has PWA routes

### Icons Not Showing
- Verify PNG files exist in public/
- Check file sizes (192x192 and 512x512)
- Clear browser cache
- Test manifest.json in DevTools

### Offline Mode Not Working
- Check service worker is active (DevTools > Application)
- Verify cache is populated
- Test with DevTools offline mode
- Check network tab for cache hits

## Additional Resources

- [PWA Best Practices](https://web.dev/pwa-checklist/)
- [iOS PWA Guide](https://developer.apple.com/documentation/webkit/safari_web_extensions)
- [Android PWA Guide](https://developer.chrome.com/docs/android/trusted-web-activity/)
- [Service Worker API](https://developer.mozilla.org/en-US/docs/Web/API/Service_Worker_API)

## Next Steps

1. **Create Proper Icons**: Replace placeholder PNGs with branded icons
2. **Test on Real Devices**: iOS and Android phones
3. **Enable HTTPS**: Required for service workers in production
4. **Add Push Notifications**: Implement user notifications (optional)
5. **Monitor Performance**: Use Lighthouse scores

Your TaskManager app is now ready to be installed as a native-like experience on any device! 🎉
