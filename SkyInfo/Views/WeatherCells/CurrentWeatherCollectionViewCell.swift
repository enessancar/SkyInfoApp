//
//  CurrentWeatherCollectionViewCell.swift
//  SkyInfo
//
//  Created by Enes Sancar on 24.09.2023.
//

import UIKit
import SnapKit


final class CurrentWeatherCollectionViewCell: UICollectionViewCell {
    static let identifier = "CurrentWeatherCollectionViewCell"
    
    private let tempatureLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 62, weight: .medium)
        return label
    }()
    
    private let conditionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 34, weight: .regular)
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
        backgroundColor = .systemBackground
        
        contentView.addSubview(tempatureLabel)
        contentView.addSubview(icon)
        contentView.addSubview(conditionLabel)
        
        conditionLabel.text = "gerg"
        tempatureLabel.text = "wrgwr"
        configureView()
    }
    
    private func configureView() {
        tempatureLabel.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
        }
        
        icon.snp.makeConstraints { make in
            make.height.width.equalTo(55)
            make.top.equalTo(tempatureLabel.snp.bottom)
            make.bottom.equalToSuperview().offset(-20)
        }
        
        conditionLabel.snp.makeConstraints { make in
            make.leading.equalTo(icon.snp.trailing).offset(10)
            make.top.equalTo(tempatureLabel.snp.bottom)
            make.trailing.equalToSuperview()
            make.height.equalTo(80)
            make.centerX.equalTo(icon.snp.centerX)
            //make.centerX.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        conditionLabel.text = nil
        icon.image = nil
        tempatureLabel.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func configure(with viewModel: CurrentWeatherCollectionViewCellViewModel) {
        icon.image = UIImage(systemName: viewModel.iconName)
        conditionLabel.text = viewModel.condition
        tempatureLabel.text = viewModel.temperature
    }
}
