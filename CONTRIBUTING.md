# Contributing to OpenAIDA

Danke, dass du zu OpenAIDA beitragen möchtest! 🚢

## Getting Started

1. **Fork** das Repository
2. **Clone** deinen Fork: `git clone https://github.com/YOUR_USERNAME/open-aida.git`
3. **Branch erstellen**: `git checkout -b feature/mein-feature`
4. Dependencies installieren: `flutter pub get`
5. Code generieren: `dart run build_runner build --delete-conflicting-outputs`

## Development Workflow

### Code-Qualität

- Folge den bestehenden Code-Konventionen (Riverpod, Freezed, GoRouter)
- Führe vor dem Commit aus:
  ```bash
  flutter analyze
  flutter test
  ```
- Neue API-Endpunkte erfordern ein Freezed-Model in `lib/core/models/`
- Neue Provider gehören in `lib/core/providers/providers.dart`

### Neue Features

Die Verzeichnisstruktur ist feature-orientiert:

```
lib/features/{feature}/
  {feature}_screen.dart   # UI
  {feature}_service.dart  # Business Logic (optional)
```

### API-Änderungen

Wenn du neue API-Endpunkte entdeckst:

1. Füge das Response-Model in `lib/core/models/` hinzu (Freezed)
2. Füge die API-Methode in `lib/core/api/aida_api.dart` hinzu
3. Füge ggf. einen Provider in `lib/core/providers/providers.dart` hinzu
4. Generiere Code: `dart run build_runner build --delete-conflicting-outputs`

### Schiffs-Erkennung

Neue Schiffe können in `lib/core/models/ship_config.dart` in die `knownShips`-Liste
eingetragen werden.

## Pull Requests

1. Beschreibe was dein PR ändert/ergänzt
2. Stelle sicher, dass `flutter analyze` und `flutter test` erfolgreich sind
3. Verlinke relevante Issues (falls vorhanden)
4. Screenshots/Screen-Recordings für UI-Änderungen sind willkommen

## Code of Conduct

Sei freundlich und respektvoll. Wir freuen uns über jeden Beitrag!

## Rechtlicher Hinweis

Durch deinen Beitrag stimmst du zu, dass dein Code unter der MIT-Lizenz
veröffentlicht wird. Achte darauf, keine AIDA-urheberrechtlich geschützten
Inhalte (Bilder, Texte etc.) ins Repository einzuchecken.
