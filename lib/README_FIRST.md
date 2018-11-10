## Flutter on Windows 

This README details the necessary steps required in order to have Flutter run on Windows.

Step 1: Project Setup 
 - Start by unzipping the contents of this file into your `project directory`. 
    - The `run.bat` file and build folder from this zip file should be in the root of your flutter project, alongside `pubspec.yaml` and the folders `lib`, `ios` and `android`

Step 2: Downloads & Configurations 
 For this to work you're going to need to have the correct flutter_engine.dll for the Flutter SDK version you're using for your app. Anytime you upgrade the Flutter SDK you'll need to upgrade the flutter_engine.dll by repeating this next step:

  - First, you need your flutter engine version. You'll find it in the SDK at `flutter\bin\internal\engine.version`. It's just a text file; open it up and set it aside for a moment.

  You get the flutter_engine.dll file from a file called "windows-x64-embedder.zip", and you get one customized for your engine version by replacing the XXXXX in the this URL with the version number from your engine.version file.
    
    `https://storage.googleapis.com/flutter_infra/flutter/XXXXXXXXXXXXXXXXXXXXXXXX/windows-x64/windows-x64-embedder.zip`

 - Once you have downloaded the file, unzip it and copy `flutter_engine.dll` to the build folder you already put in your flutter project when you did Step 1.

 - Next, we need to add the `icudtl.dat` to your build folder. Copy it from the Futter SDK: flutter\bin\cache\artifacts\engine\windows-x64\ and put it in the build folder with the flutter_engine.dll

 All of your files are now where they need to be, but...

 WARNING! If you run "flutter clean" in your project directory then it will delete the build folder. So, as a precaution, you probably want to make a copy of the build folder now and rename the copy. If you do need to run flutter clean at some point then won't have to go through all of this again. Just make another copy of your backup and rename it to build.


Step 3: Dart/Flutter Configuration 

Running things this way, the first thing you need to do in your main.dart function is establish what platform your app is running on:

Add dart io and the foundation package to your imports:
```dart 
import 'dart:io';
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
    ...
```    

Next, add this function to your file (it's fine to put it under main.dart).
```dart 
void _setTargetPlatformForDesktop() {

  TargetPlatform targetPlatform;

   if (Platform.isMacOS) {
     targetPlatform = TargetPlatform.iOS;
   } else if (Platform.isLinux || Platform.isWindows) {
          targetPlatform = TargetPlatform.android;
   }

    if (targetPlatform != null) {
    debugDefaultTargetPlatformOverride = targetPlatform;
    }

}

```

And finally, change your `main()` function to:

```dart 
void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.android;
  _setTargetPlatformForDesktop();
  runApp(MyApp());
}
```

Now your code will check the platform it's running on and set the targetPlatform appropriately, no matter what platform you're on.

Step 4: Running
When you're ready to run your project, type `run.bat` either from a terminal prompt in the project level directory.
- This will first run "flutter build bundle". It's a method of building the project that we need to run on Windows this way, but it's different from the normal debug or release builds.
- It will then cd into the build directory and run _FlutterDemoConsole.exe_
- Lastly, it will `cd` you back to the project directory so that you won't have to do it yourself every time you want to execute the run command.

That's it!
Now go run Flutter on Windows and make your friends jealous!

PS: This is all changing very quickly. People are working on a way to make an exe you put in your path, which will allow you to run it from within any Flutter project and it will handle all of this for you. The idea is that it will "just work", in any Flutter project, anywhere.

Stay tuned for updates!