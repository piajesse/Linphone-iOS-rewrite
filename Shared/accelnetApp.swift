//
//  accelnetApp.swift
//  Shared
//
//  Created by piajesse on 10/19/21.
//

import SwiftUI

var version: String = "0.1"

@main
struct accelnetApp: App {
	var body: some Scene {
		WindowGroup {
			theView()
		}
	}
}
// Returns an array with [(Version of the app), (Version of the SDK)]
public func getVersion() -> String {
	return version
}
extension UIColor {
	convenience init(light: UIColor, dark: UIColor) {
		self.init { traitCollection in
			switch traitCollection.userInterfaceStyle {
			case .light, .unspecified:
				return light
			case .dark:
				return dark
			@unknown default:
				return light
			}
		}
	}
}

extension Color {
	init(light: Color, dark: Color) {
		self.init(UIColor(light: UIColor(light), dark: UIColor(dark)))
	}
	static let defaultBackground = Color(light: .white, dark: .black)
	static let defaultForeground = Color(light: .black, dark: .white)
}

extension String {
	var isValidURL: Bool {
		let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
		if let match = detector.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) {
			// it is a link, if the match covers the whole string
			return match.range.length == self.utf16.count
		} else {
			return false
		}
	}
}
// From https://stackoverflow.com/questions/56505528/swiftui-update-navigation-bar-title-color
struct NavigationConfigurator: UIViewControllerRepresentable {
	var configure: (UINavigationController) -> Void = { _ in }
	
	func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
		UIViewController()
	}
	func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
		if let nc = uiViewController.navigationController {
			self.configure(nc)
		}
	}
	
}