//
//  COSOverlayVisualizerWindow.m
//  COSTouchVisualizer
//
//  Created by Joseph Blau on 11/30/17.
//  Copyright © 2017 conopsys. All rights reserved.
//

#import "COSOverlayVisualizerWindow.h"

@class COSOverlayVisualizerWindow;

@interface COSOverlayVisualizerViewController : UIViewController

@property (nonatomic, weak) COSOverlayVisualizerWindow *overlayWindow;

@end

@interface COSOverlayVisualizerWindow ()

- (UIViewController *)cos_applicationRootViewController;

@end

@implementation COSOverlayVisualizerWindow

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self cos_installRootViewController];
    }
    return self;
}

- (instancetype)initWithWindowScene:(UIWindowScene *)windowScene {
    self = [super initWithWindowScene:windowScene];
    if (self) {
        [self cos_installRootViewController];
        [self cos_updateGeometry];
    }
    return self;
}

- (void)setWindowScene:(UIWindowScene *)windowScene {
    [super setWindowScene:windowScene];
    [self cos_updateGeometry];
}

#pragma mark - Scene Geometry

- (void)cos_updateGeometry {
    UIWindowScene *windowScene = self.windowScene;
    if (windowScene == nil) {
        return;
    }

    CGRect sceneBounds;
    if (@available(iOS 26.0, *)) {
        sceneBounds = windowScene.effectiveGeometry.coordinateSpace.bounds;
    } else {
        sceneBounds = windowScene.coordinateSpace.bounds;
    }

    CGRect bounds = (CGRect){ .origin = CGPointZero, .size = sceneBounds.size };
    CGPoint center = CGPointMake(CGRectGetMidX(sceneBounds), CGRectGetMidY(sceneBounds));
    if (!CGRectEqualToRect(self.bounds, bounds)) {
        self.bounds = bounds;
    }
    if (!CGPointEqualToPoint(self.center, center)) {
        self.center = center;
    }
}

#pragma mark - Root View Controller

- (void)cos_installRootViewController {
    COSOverlayVisualizerViewController *viewController = [COSOverlayVisualizerViewController new];
    viewController.overlayWindow = self;
    self.rootViewController = viewController;
}

- (UIViewController *)cos_applicationRootViewController {
    for (UIWindow *window in self.windowScene.windows) {
        if (self == window) {
            continue;
        }
        if (window.rootViewController != nil) {
            return window.rootViewController;
        }
    }
    return nil;
}

@end

@implementation COSOverlayVisualizerViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.overlayWindow.cos_applicationRootViewController.preferredStatusBarStyle;
}

- (BOOL)prefersStatusBarHidden {
    return self.overlayWindow.cos_applicationRootViewController.prefersStatusBarHidden;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    return self.overlayWindow.cos_applicationRootViewController.preferredStatusBarUpdateAnimation;
}

@end
