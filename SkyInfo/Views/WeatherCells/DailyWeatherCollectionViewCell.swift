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
    
    private let tempatureLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 22 , weight: .bold)
        return label
    }()
    
    private let icon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }() 
    
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .tertiarySystemBackground
        
        timeLabel.text = "rw"
        configureView()
    }
    
    private func configureView() {
        timeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(40)
        }
        
        icon.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(timeLabel.snp.trailing).offset(10)
            make.height.equalTo(32)
        }
        
        tempatureLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(icon.snp.trailing).offset(20)
            make.trailing.equalToSuperview().offset(-15)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        timeLabel.text = nil
        icon.image = nil
        tempatureLabel.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func configure(with viewModel: DailyWeatherCollectionViewCellViewModel) {
        icon.image = UIImage(systemName: viewModel.iconName)
        tempatureLabel.text = viewModel.temperature
        timeLabel.text = viewModel.day
    }
}
