# WhatsApp Chat Screen — Flutter Implementation

A Flutter implementation of a WhatsApp chat screen based on the Figma specification (attached image), with high visual accuracy:

* **Colors**: White `#FFFFFF` · Green `#168C4B` · Black `#181818` · Outgoing bubble `#232D3D`
* **AppBar**: Green background, back icon, circular profile picture, bold name at 14px, voice/video call icons, and three-dot menu.
* **Message bubbles**:

  * Incoming: Green, white text at 16px, top-left corner radius = 0.
  * Outgoing: Dark gray `#232D3D`, white text at 16px, top-right corner radius = 0.
  * All other corners have a radius of 16.
* **Body**: Dark background `#181818` with a repeating WhatsApp-style doodle pattern (chat, call, camera, microphone, etc.) created using a custom `CustomPainter` instead of a static image, with 16px horizontal padding.
* **Input bar**: Rounded text field with a 1px green border, camera icon as the prefix, send icon as the suffix, and `"Type a message..."` hint in white at 12px. A raised circular green microphone button is placed beside it.

## Project Structure

```text
whatsapp_chat_ui/
├── pubspec.yaml
├── analysis_options.yaml
└── lib/
    ├── main.dart
    ├── theme/app_colors.dart
    ├── models/chat_message.dart
    ├── widgets/
    │   ├── chat_app_bar.dart
    │   ├── message_bubble.dart
    │   ├── chat_input_bar.dart
    │   └── doodle_background.dart
    └── screens/chat_screen.dart
```

## How to Run

The project is built using Dart/Flutter only, without pre-generated `android/ios` folders, so it remains lightweight and portable.

### 1. Make sure Flutter SDK is installed

Run:

```bash
flutter --version
```

### 2. Create a new empty Flutter project

This will automatically generate the required `android`, `ios`, `web`, and other platform folders:

```bash
flutter create whatsapp_chat_ui
```

### 3. Replace the default files

Go inside the newly created project folder.

Delete the default `lib` folder and the default `pubspec.yaml`, then replace them with the files provided in this project.

Also replace `analysis_options.yaml`.

### 4. Install the dependencies

Run:

```bash
flutter pub get
```

### 5. Run the application

```bash
flutter run
```

## Notes

* **Images**: Profile pictures and media-message images are implemented as placeholders using custom drawings/icons instead of real image assets, since the original design did not provide the actual image files. You can easily replace them with real images using `Image.asset('...')` or `Image.network('...')` in `chat_app_bar.dart` and `message_bubble.dart`.

* **Sample Messages**: The sample messages (`Hello`, `Reply?`, etc.) are placeholder data used only to demonstrate the four required message types:

  1. Incoming text message
  2. Outgoing text message
  3. Incoming image + caption message
  4. Outgoing text message

  They can easily be replaced with real data or connected to a backend.

* **Component Structure**: The code is divided into reusable components (`AppBar`, `MessageBubble`, `InputBar`, and `Background`) to make the UI easier to maintain, reuse, and modify.
