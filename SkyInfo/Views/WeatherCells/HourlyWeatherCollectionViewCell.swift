//
//  HourlyWeatherCollectionViewCell.swift
//  SkyInfo
//
//  Created by Enes Sancar on 24.09.2023.
//

import UIKit
import SnapKit

final class HourlyWeatherCollectionViewCell: UICollectionViewCell {
    static let identifier = "HourlyWeatherCollectionViewCell"
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
