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
    
    private let tempatureLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .regular)
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
        contentView.backgroundColor = .secondarySystemBackground
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.secondaryLabel.cgColor
        
        contentView.addSubview(timeLabel)
        contentView.addSubview(icon)
        contentView.addSubview(tempatureLabel)
        
        configureView()
    }
    
    private func configureView() {
        timeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(40)
            make.leading.trailing.equalToSuperview()
        }
        
        icon.snp.makeConstraints { make in
            make.top.equalTo(timeLabel.snp.bottom)
            make.height.equalTo(32)
            make.leading.trailing.equalToSuperview()
        }
        
        tempatureLabel.snp.makeConstraints { make in
            make.top.equalTo(icon.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        tempatureLabel.text = nil
        icon.image = nil
        tempatureLabel.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func configure(with viewModel: HourlyWeatherCollectionViewCellViewModel) {
        icon.image = UIImage(systemName: viewModel.iconName)
        tempatureLabel.text = viewModel.temperature
        timeLabel.text = viewModel.hour
    }
}
