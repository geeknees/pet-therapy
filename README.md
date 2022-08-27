# Desktop Pets

This is the source code of my macOS app [Desktop Pets](https://apps.apple.com/app/desktop-pets/id1575542220)!.

As you can guess, it brings Desktop Pets to macOS 🚀

[![Get it on the App Store](Gallery/appstore_badge.png)](https://apps.apple.com/app/desktop-pets/id1575542220)

## What's a Desktop Pet?

It's just a cute little animal that lives in your computer.

The most popular one was probably the [eSheep](https://github.com/Adrianotiger/desktopPet) for Windows 95.

Hope you like them too!

## News

I'm currently working to allow pets to interact with windows (from other apps) open on your system.

In other words, when a pet is "falling" it will stop on top of any window it finds on its way to the bottom of the screen (just like other Desktop Pets programs did in the past).

You will soon be able enable this from settings (it's not working yet).

The window-detection service is also open source and implemented [here](https://github.com/curzel-it/windows-detector).

## Screenshots

![Screenshot of my mac running the app](Gallery/1.png)
![Ufo attacking Desktop City](Gallery/bombing.gif)

## Running the Project

1. Download and setup Xcode
1. Open the `PetTherapy` workspace
1. Give Xcode some time to figure out dependencies...
1. Select target 'Desktop Pets Dev'

For daily use I recommend getting the App from the App Store.

## Troubleshooting

### Swift Packages not loading
Unfortunately, Xcode does not like local swift packages very much. In case you get any error about missing packages, try the following:
1. Clean build folder (Product > Clean)
1. Reset Packages Cache (Package Dependencies > Right Click)
1. Close and re-open Xcode
1. Build   

