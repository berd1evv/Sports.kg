//
//  InfraTableViewCell.swift
//  Sports.kg
//
//  Created by Eldiiar on 26/10/22.
//

import UIKit

class InfraTableViewCell: UITableViewCell {
    
    private lazy var infraIcon: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        return label
    }()

    private lazy var checkImg: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "check")
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //backgroundColor = .white
        
        addSubviews(
            infraIcon,
            titleLabel,
            checkImg
        )
        
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpData(model: Infrastructure) {
        titleLabel.text = model.title
        guard let imageURL = URL(string: model.image ?? "") else { return }
        infraIcon.sd_setImage(with: imageURL)
    }

    func setUpConstraints() {
        infraIcon.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(15)
            make.height.width.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(infraIcon.snp.right).offset(16)
        }
        
        checkImg.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(15)
            make.width.height.equalTo(18)
        }
    }
}
