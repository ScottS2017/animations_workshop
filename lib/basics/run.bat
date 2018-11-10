@echo off
cmd /c flutter build bundle
cd build
FlutterDemoConsole.exe
cd ..
