# OpenAIDA 🚢

Eine Open-Source Alternative zur offiziellen AIDA Bordportal-App.

[![Build & Test](https://github.com/YOUR_USERNAME/open-aida/actions/workflows/build.yml/badge.svg)](https://github.com/YOUR_USERNAME/open-aida/actions/workflows/build.yml)

## Features

| Tab | Beschreibung |
|-----|-------------|
| 🏠 **Home** | Live Schiffsposition auf OpenStreetMap, Wetter, Kurs, Temperaturen, nächster Hafen mit ETA |
| 📅 **Programm** | Tagesevents mit Kategorie-Filter, Öffnungszeiten der Venues |
| 🏖️ **Mein Urlaub** | Persönliche Buchungen (Timetable), Reiseroute (Itinerary), Ausflüge |
| 🔍 **Entdecken** | Restaurants & Bars, POIs, Spa & Wellness |
| 👤 **Konto** | Kontostand, Bord-E-Mails, Mitreisende |

## Technologie-Stack

- **Flutter** (iOS, Android, Web) mit Null-Safety
- **Riverpod** für State Management
- **GoRouter** für Navigation
- **Dio** für HTTP mit Auto-Token-Injection, Retry bei 401, 5-min Cache
- **Freezed** + **json_serializable** für Type-safe API Models
- **flutter_secure_storage** für Token-Speicherung
- **flutter_map** + OpenStreetMap (kein Google Maps API Key nötig)
- **GitHub Actions** CI/CD für alle drei Plattformen

## Schiffs-Erkennung

Beim ersten Start erkennt die App automatisch das Schiff:

1. SSID-Check: Gerät muss im WLAN `AIDA-*` oder `aida*` sein
2. Sequenzielle Prüfung aller bekannten AIDA-Schiffe via `GET /assets/config.json`
3. Cache in SharedPreferences (TTL: 12 Stunden)
4. Manueller Override im Onboarding

## API-Dokumentation

Die App kommuniziert direkt mit der AIDA Bordportal-API. Die API-Endpunkte wurden
mittels Proxyman-Traffic-Capture analysiert (Logs im Ordner `proxyman/`).

**Base URLs** (dynamisch nach Schiff):
- Portal: `https://bordportal.{schiff}.aida.de`
- Ext-API: `https://ext-api.{schiff}.aida.de`
- Chat: `https://chat.{schiff}.aida.de`

**Bekannte Schiffe**: cosma, vita, sol, qube, prima, nova, mira, mar, luna, diva, cara, blu, bella, stella, perla, aura

## Authentifizierung

```
GET /api/ext/Aida.aidajsonwebservice/auth-guest
    /cabinnr/{cabin}/name/{surname}/pin/{pin}

Response: { cookieToken, guest, jwt, sessionToken }

Alle weiteren Requests: ?p_auth={cookieToken}
```

Token wird sicher in `flutter_secure_storage` gespeichert.
Bei 401-Fehlern wird automatisch neu authentifiziert.

## Setup & Entwicklung

### Voraussetzungen

- Flutter SDK `>=3.10.0`
- Dart SDK `>=3.10.0`
- Xcode (für iOS-Build)
- Android Studio / SDK (für Android-Build)

### Installation

```bash
git clone https://github.com/YOUR_USERNAME/open-aida.git
cd open-aida
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

### Code-Generierung (nach Model-Änderungen)

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Builds

```bash
# Android
flutter build apk
flutter build appbundle

# iOS
flutter build ipa --no-codesign

# Web
flutter build web
```

## Projektstruktur

```
lib/
  core/
    api/          # Dio-Client, Interceptors, Auth-Handler
    models/       # Freezed data classes für alle API-Responses
    providers/    # Riverpod providers
    router/       # GoRouter config
  features/
    ship_detection/   # SSID-Check, Schiffs-Erkennung
    auth/             # Login, Token-Management
    home/             # Schiffsposition, Wetter
    program/          # Events, Öffnungszeiten
    my_vacation/      # Timetable, Itinerary, Ausflüge
    discover/         # Restaurants, POIs, Spa
    account/          # Konto, E-Mails, Gäste
  shared/
    widgets/
    theme/
```

## Rechtlicher Hinweis

Dieses Projekt ist nicht mit AIDA Cruises affiliiert und wird nicht von AIDA Cruises
unterstützt oder genehmigt. Es ist ein Open-Source-Projekt für persönliche und
Bildungszwecke. Die Verwendung erfolgt auf eigene Verantwortung.

## Mitwirken

Siehe [CONTRIBUTING.md](CONTRIBUTING.md).

## Lizenz

MIT License – Details in [LICENSE](LICENSE).
