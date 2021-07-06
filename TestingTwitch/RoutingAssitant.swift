//
//  RoutingAssitant.swift
//  TestingTwitch
//
//  Created by Pavel Zveglyanich on 7/6/21.
//

import Foundation
import UIKit


protocol RoutingAssistantProtocol {
	func setRootNavigationController(_ navigationController: UINavigationController)
	func constructStartViewController(completion: @escaping (_ startViewController: UIViewController?) -> ())
}

private protocol ModuleMakerProtocol {
	func constructMainContainer() -> UIViewController?
}

private protocol ModuleConstructorProtocol {
	func construct(view: UIViewController, with configurator: BaseConfiguratorProtocol, navigationViewController: UINavigationController?) -> UIViewController
}


protocol BaseConfiguratorProtocol {
	func configure(viewController: UIViewController, navigationController: UINavigationController?)
}


final class RoutingAssistant: NSObject {

	static let shared = RoutingAssistant()

	private var rootNavigationController: UINavigationController!
	private var MainController: UIViewController?

	private override init() { super.init() }
}

extension RoutingAssistant: RoutingAssistantProtocol {
	func constructStartViewController(completion: @escaping (UIViewController?) -> ()) {
		if self.MainController == nil {
			self.MainController = self.constructMainContainer()
		}
		completion(self.MainController)
	}
	
	func setRootNavigationController(_ navigationController: UINavigationController) {
		rootNavigationController = navigationController
	}
}

extension RoutingAssistant: ModuleMakerProtocol {
	func constructMainContainer() -> UIViewController? {
		return construct(view: MainViewController(), with: MainConfigurator(), navigationViewController: rootNavigationController)
	}
}

extension RoutingAssistant: ModuleConstructorProtocol {
	func construct(view: UIViewController, with configurator: BaseConfiguratorProtocol, navigationViewController: UINavigationController?) -> UIViewController {
		configurator.`configure`(viewController: view, navigationController: navigationViewController)
		return view
	}
}
