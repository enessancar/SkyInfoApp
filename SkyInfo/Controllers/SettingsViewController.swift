//
//  SettingsViewController.swift
//  SkyInfo
//
//  Created by Enes Sancar on 21.09.2023.
//

import UIKit
import SnapKit
import SwiftUI

final class SettingsViewController: UIViewController {
    
    private let primaryView: SettingsView = {
        let view = SettingsView()
        let viewModel = SetttingsViewViewModel(options: SettingOption.allCases)
        view.configure(with: viewModel)
        return view
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        primaryView.delegate = self
    }
    
    private func setupView() {
        view.addSubview(primaryView)
        primaryView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension SettingsViewController: SettingsViewDelegate {
    func settingsView(_ settingsView: SettingsView, didTap option: SettingOption) {
        switch option {
        case .upgrade:
            break
        case .privacyPolicy:
            break
        case .terms:
            break
        case .contact:
            break
        case .getHelp:
            break
        case .rateApp:
            break
        }
    }
}
