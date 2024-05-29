//
//  SettingsViewModel.swift
//  Ball Master
//
//  Created by admin on 27.05.2024.
//

import Foundation
import StoreKit
import MessageUI

struct SectionSettings: Hashable {
    let options: [SettingsOptionType]
}

enum SettingsOptionType: Hashable {
    case staticCell(model: SettingsOption)
    case switchCell(model: SettingsSwitchOption)
}

struct SettingsOption: Hashable {
    let title: String
    let picture: String
}

struct SettingsSwitchOption: Hashable {
    let title: String
    let isOn: Bool
}

class SettingsViewModel: ObservableObject {
    private let coordinator: CoordinatorProtocol?
    var view: TabViewVC?
    init(coordinator: CoordinatorProtocol? = nil, view: TabViewVC? = nil) {
        self.coordinator = coordinator
        self.view = view
    }
    
    var settings: [SectionSettings] = [
        SectionSettings(options: [
            .switchCell(model: SettingsSwitchOption(title: "Notification", isOn: AppData.shared.isNotifications )),
            .switchCell(model: SettingsSwitchOption(title: "Vibration", isOn: AppData.shared.isVibration)),
            .staticCell(model: SettingsOption(title: "Terms of Service", picture: "next")),
            .staticCell(model: SettingsOption(title: "Privacy Policy", picture: "next")),
            .staticCell(model: SettingsOption(title: "Feedback", picture: "next")),
            .staticCell(model: SettingsOption(title: "Rate Us", picture: "next")),
            .staticCell(model: SettingsOption(title: "Favorites", picture: "next")),
            .staticCell(model: SettingsOption(title: "Best Practice", picture: "next"))
        ])
    ]
}


extension SettingsViewModel {
    func openTerms() {
        coordinator?.showTermsPolicy(type: .terms)
    }
    
    func openPolicy() {
        coordinator?.showTermsPolicy(type: .privacy)
    }
    
    func showBestPractce() {
        
    }
    
    @MainActor func alertShow() {
//        showAlert(with: "You alredy call request", with: "please wait to send an email", viewcontroller: self.view!)
    }
    
    @MainActor func openScreenByTittle(title: String) {
        switch title {
        case "Terms of Service" : openTerms()
        case "Privacy Policy" : openPolicy()
        case "Rate Us" : rateApp()
        case "Feedback" : support()
        case "Best Practice": showBestPractce()
        default: break
        }
    }
    
    func rateApp() {
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
            
        } else if let url = URL(string: "itms-apps://itunes.apple.com/app/" + "appId") {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    func shareApp() {
        guard let url = URL(string: "https://www.google.com") else {
            return
        }
        let shareSheetVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        view?.present(shareSheetVC, animated: true)
    }
    
    @MainActor func support() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = view as! any MFMailComposeViewControllerDelegate
            mail.setToRecipients(["cresfeedback@gmail.com"])
            mail.setSubject("Your great app: support")
            mail.setMessageBody("Hello, ", isHTML: false)
            view?.present(mail, animated: true)
        } else {
            print("Application is not able to send an email")
//            showAlert(with: "Application is not able", with: "to send an email", viewcontroller: view!)
        }
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
