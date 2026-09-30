//
//  AppDelegate.swift
//  TouchVisualizer
//
//  Created by Joseph Blau on 5/18/15.
//  Copyright (c) 2015 Conopsys. All rights reserved.
//

import UIKit
import COSTouchVisualizer

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    internal var window: UIWindow? = {
        let contactConfig = COSTouchConfig(touchConfigType: .contact)
        contactConfig.fillColor = .purple
        contactConfig.strokeColor = .blue
        contactConfig.alpha = 0.4

        let rippleConfig = COSTouchConfig(touchConfigType: .ripple)
        rippleConfig.fillColor = .purple
        rippleConfig.strokeColor = .blue
        rippleConfig.alpha = 0.1

        return COSTouchVisualizerWindow(
            frame: UIScreen.main.bounds,
            morphEnabled: true,
            touchVisibility: .remoteAndLocal,
            contactConfig: contactConfig,
            rippleConfig: rippleConfig
        )
    }()

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        return true
    }
}
