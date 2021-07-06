//
//  SceneDelegate.swift
//  TestingTwitch
//
//  Created by Pavel Zveglyanich on 7/6/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?
	var routingAssistant: RoutingAssistantProtocol = RoutingAssistant.shared

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		
		guard let windowScene = (scene as? UIWindowScene) else { return }
		window = UIWindow(windowScene: windowScene)
		
		let navigationController = UINavigationController()
		routingAssistant.setRootNavigationController(navigationController)
		routingAssistant.constructStartViewController { [unowned self] MainViewController in
			
			if let MainVC = MainViewController {
				navigationController.viewControllers = [MainVC]
				//navigationController.isNavigationBarHidden = true
				self.window?.rootViewController = navigationController
				self.window?.makeKeyAndVisible()
			} else {
				fatalError("Failure startViewControllerCreating")
			}
		}
	}
}

