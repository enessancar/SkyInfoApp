//
//  SettingsViewController.swift
//  SkyInfo
//
//  Created by Enes Sancar on 21.09.2023.
//

import UIKit
import SnapKit

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
    }
    
    private func setupView() {
        view.addSubview(primaryView)
        primaryView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

