import UserNotifications
import Foundation

@objc(CriticalAlerts) class CriticalAlerts: CDVPlugin {
	@objc(requestPermission:)
	func requestPermission(command: CDVInvokedUrlCommand) {
		let center = UNUserNotificationCenter.current()
		center.requestAuthorization(options: [.criticalAlert]) { granted, error in
			if let error = error {
				self.commandDelegate.send(
					CDVPluginResult(status: .error, messageAs: error.localizedDescription),
					callbackId: command.callbackId
				)
				return
			}

			self.commandDelegate.send(
				CDVPluginResult(status: .ok, messageAs: granted),
				callbackId: command.callbackId
			)
		}
	}
}
