# COSTouchVisualizer

![COSTouchVisualizer](https://raw.githubusercontent.com/conopsys/COSTouchVisualizer/master/touchvisdemo.gif "COSTouchVisualizer iOS")

[![Version](http://cocoapod-badges.herokuapp.com/v/COSTouchVisualizer/badge.png)](http://cocoadocs.org/docsets/COSTouchVisualizer)
[![Platform](http://cocoapod-badges.herokuapp.com/p/COSTouchVisualizer/badge.png)](http://cocoadocs.org/docsets/COSTouchVisualizer)

## Swift Usage

Create the visualizer window with its designated initializer. Passing `nil` for either configuration uses the default appearance.

```swift
import COSTouchVisualizer
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow? = COSTouchVisualizerWindow(
        frame: UIScreen.main.bounds,
        morphEnabled: true,
        touchVisibility: .remoteAndLocal,
        contactConfig: nil,
        rippleConfig: nil
    )
}
```

## Objective-C Usage

Create the window programmatically in the app delegate, including when the app's view controllers are loaded from a storyboard. The plain `init`, `initWithFrame:`, and `initWithCoder:` initializers are unavailable.

```objective-c
#import <COSTouchVisualizerWindow.h>

- (COSTouchVisualizerWindow *)window {
    static COSTouchVisualizerWindow *customWindow = nil;
    if (!customWindow) {
        customWindow = [[COSTouchVisualizerWindow alloc]
            initWithFrame:UIScreen.mainScreen.bounds
            morphEnabled:YES
            touchVisibility:COSTouchVisualizerWindowTouchVisibilityRemoteAndLocal
            contactConfig:nil
            rippleConfig:nil];
    }
    return customWindow;
}
```

### Customization

Configure the contact and ripple appearance before creating the window:

```objective-c
#import <COSTouchConfig.h>

COSTouchConfig *contactConfig =
    [[COSTouchConfig alloc] initWithTouchConfigType:COSTouchConfigTpyeContact];
contactConfig.fillColor = UIColor.yellowColor;
contactConfig.strokeColor = UIColor.purpleColor;
contactConfig.alpha = 0.4;

COSTouchConfig *rippleConfig =
    [[COSTouchConfig alloc] initWithTouchConfigType:COSTouchConfigTpyeRipple];
rippleConfig.fillColor = UIColor.yellowColor;
rippleConfig.strokeColor = UIColor.purpleColor;
rippleConfig.alpha = 0.1;

COSTouchVisualizerWindow *window = [[COSTouchVisualizerWindow alloc]
    initWithFrame:UIScreen.mainScreen.bounds
    morphEnabled:YES
    touchVisibility:COSTouchVisualizerWindowTouchVisibilityRemoteAndLocal
    contactConfig:contactConfig
    rippleConfig:rippleConfig];
```

## Requirements

This project requires iOS 16 or later and ARC.

## Installation

### Swift Package Manager

In Xcode, select **File > Add Package Dependencies** and enter:

    https://github.com/cardinalblue/COSTouchVisualizer.git

Then add `COSTouchVisualizer` to your app target.

### CocoaPods

COSTouchVisualizer remains available through [CocoaPods](https://cocoapods.org). Add the following line to your Podfile:

    pod "COSTouchVisualizer"

### Carthage

Add the following line to your Cartfile:

    github "cardinalblue/COSTouchVisualizer"

## Author

Joe Blau, josephblau@gmail.com

## License

COSTouchVisualizer is available under the MIT license. See the LICENSE file for more info.
