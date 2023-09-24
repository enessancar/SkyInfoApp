//
//  DailyWeatherCollectionViewCell.swift
//  SkyInfo
//
//  Created by Enes Sancar on 24.09.2023.
//

import UIKit
import SnapKit

final class DailyWeatherCollectionViewCell: UICollectionViewCell {
    static let identifier = "DailyWeatherCollectionViewCell"
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .purple
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
