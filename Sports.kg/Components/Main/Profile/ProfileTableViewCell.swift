//
//  ChecklistTableViewCell.swift
//  MedTech
//
//  Created by Eldiiar on 10/7/22.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    
    private lazy var stadiumImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo.fill")
        return imageView
    }()
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Dordoi"
        return label
    }()
    
    private lazy var priceLabel : UILabel = {
        let label = UILabel()
        label.text = "1000som/hour"
        label.textColor = UIColor(red: 0.957, green: 0.427, blue: 0.427, alpha: 1)
        return label
    }()
    
    private lazy var addressLabel : UILabel = {
        let label = UILabel()
        label.text = "st.Gorkiy 59"
        return label
    }()
    
    private lazy var favouriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        return button
    }()

    private lazy var moreButton: UIButton = {
        let button = UIButton()
        button.setTitle("More", for: .normal)
        button.setTitleColor(UIColor(red: 0.957, green: 0.427, blue: 0.427, alpha: 1), for: .normal)
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        
        addSubviews(
            stadiumImage,
            titleLabel,
            priceLabel,
            addressLabel,
            favouriteButton,
            moreButton
        )
        
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpData(model: String) {
        
    }
    
    func setUpConstraints() {
        stadiumImage.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(8)
            make.left.equalToSuperview().inset(16)
            make.height.width.equalTo(128)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(stadiumImage.snp.top)
            make.left.equalTo(stadiumImage.snp.right).offset(8)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalTo(stadiumImage.snp.right).offset(8)
        }
        
        addressLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(8)
            make.left.equalTo(stadiumImage.snp.right).offset(8)
        }
        
        favouriteButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(33)
            make.right.equalToSuperview().inset(24)
            make.width.equalTo(30)
            make.height.equalTo(28)
        }
        
        moreButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(13)
            make.bottom.equalToSuperview().inset(13)
        }
    }
    
}
