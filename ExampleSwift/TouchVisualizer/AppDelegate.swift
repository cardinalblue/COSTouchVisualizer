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
class AppDelegate: UIResponder, UIApplicationDelegate {}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }

        let contactConfig = COSTouchConfig(touchConfigType: .contact)
        contactConfig.fillColor = .purple
        contactConfig.strokeColor = .blue
        contactConfig.alpha = 0.4

        let rippleConfig = COSTouchConfig(touchConfigType: .ripple)
        rippleConfig.fillColor = .purple
        rippleConfig.strokeColor = .blue
        rippleConfig.alpha = 0.1

        // .remoteAndLocal shows fingertips even without a mirrored screen.
        let window = COSTouchVisualizerWindow(
            windowScene: windowScene,
            morphEnabled: true,
            touchVisibility: .remoteAndLocal,
            contactConfig: contactConfig,
            rippleConfig: rippleConfig
        )
        window.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        self.window = window
        window.makeKeyAndVisible()
    }
}
