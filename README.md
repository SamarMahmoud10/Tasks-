# WhatsApp Chat Screen — Flutter Implementation

تنفيذ Flutter لشاشة شات واتساب طبقًا لسبيسيفيكيشن الفيجما (الصورة المرفقة)، بدقّة عالية:

- **Colors**: White `#FFFFFF` · Green `#168C4B` · Black `#181818` · Outgoing bubble `#232D3D`
- **AppBar**: خلفية خضراء، أيقونة رجوع، صورة بروفايل دائرية، اسم بولد مقاس 14، أيقونات مكالمة صوت/فيديو، قائمة (3 نقط).
- **Message bubbles**: الوارد (يسار) أخضر مع نص أبيض 16px وزاوية علوية-يسار = 0. الصادر (يمين) رمادي غامق `#232D3D` مع نص أبيض 16px وزاوية علوية-يمين = 0. باقي الزوايا radius = 16.
- **Body**: خلفية داكنة `#181818` مع نقشة (doodle pattern) متكررة من أيقونات واتساب (شات، مكالمة، كاميرا، مايك...) برسم مخصص (CustomPainter) بدل صورة ثابتة، مع padding أفقي 16.
- **Input bar**: حقل نص بيضاوي بحدود خضراء 1px، أيقونة كاميرا (prefix)، أيقونة إرسال (suffix)، Hint "Type a message..." أبيض مقاس 12، وزرار مايك دائري أخضر مرفوع (elevated) بجانبه.

## بنية المشروع

```
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

## طريقة التشغيل

المشروع مبني بـ Dart/Flutter فقط (بدون مجلدات android/ios جاهزة، عشان يفضل خفيف ومحمول). لتشغيله:

1. لازم يكون عندك Flutter SDK متثبت. تأكدي بـ:
   ```bash
   flutter --version
   ```

2. اعملي مشروع Flutter جديد فاضي (عشان يجيب مجلدات android/ios/web تلقائي):
   ```bash
   flutter create whatsapp_chat_ui
   ```

3. روحي داخل المجلد اللي اتعمل، وامسحي مجلد `lib` وملف `pubspec.yaml` الافتراضيين، واستبدليهم بالملفات اللي جوه المجلد ده (وكمان `analysis_options.yaml`).

4. رجعي تجيبي الباكدجز:
   ```bash
   flutter pub get
   ```

5. شغلي المشروع:
   ```bash
   flutter run
   ```

## ملاحظات

- الصور (زي صورة البروفايل وصورة الرسالة اللي فيها ميديا) اتعملت كـ placeholders برسم/أيقونات بدل ملفات صور حقيقية، لأن التصميم الأصلي مكانش متاح كملفات assets. سهل تستبدليها بصور حقيقية عن طريق `Image.asset('...')` أو `Image.network('...')` في `chat_app_bar.dart` و `message_bubble.dart`.
- الرسائل التجريبية (Hello, Reply?, ... إلخ) Sample data بس عشان تُظهر الأشكال الأربعة المطلوبة (رسالة واردة نص، رسالة صادرة نص، رسالة واردة بصورة+كابشن، رسالة صادرة نص) — سهل تستبدليها ببيانات حقيقية أو تربطيها بـ backend.
- الكود متقسم مكونات منفصلة (AppBar / Bubble / InputBar / Background) عشان يبقى قابل لإعادة الاستخدام والتعديل بسهولة.
