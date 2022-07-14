//
//  SceneDelegate.swift
//  ScrollView
//
//  Created by Jonathan Nunez on 7/12/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        window?.makeKeyAndVisible()
        window?.rootViewController = ViewController()
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }
}

