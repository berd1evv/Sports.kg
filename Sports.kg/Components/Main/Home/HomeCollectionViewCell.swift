//
//  HomeCollectionViewCell.swift
//  Sports.kg
//
//  Created by Eldiiar on 9/10/22.
//

import UIKit
import SnapKit
import SDWebImage

class HomeCollectionViewCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo.fill")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        return imageView
    }()
    
    private lazy var priceLabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemIndigo
        label.text = "1350 som"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    private let title: UILabel = {
        let label = UILabel()
        label.text = "Dordoi"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private lazy var addressIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "address")
        return imageView
    }()

    private lazy var addressLabel : UILabel = {
        let label = UILabel()
        label.text = "M.Gorkiy 34/5"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews(
            imageView,
            priceLabel,
            title,
            addressIcon,
            addressLabel
        )
        
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getData(_ model: HomeResults) {
        title.text = model.title
        priceLabel.text = "\(model.price ?? 0) сом"
        addressLabel.text = model.address
        guard let imageURL = URL(string: model.image ?? "") else { return }
        imageView.sd_setImage(with: imageURL)
    }
    
    func setUpConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(194)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView).inset(10)
            make.right.equalTo(imageView)
            make.height.equalTo(31)
            make.width.equalTo(82)
        }
        
        title.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).inset(-5)
            make.left.equalToSuperview().inset(5)
            make.right.equalToSuperview().inset(5)
        }
        
        addressIcon.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).inset(-10)
            make.left.equalToSuperview().inset(5)
            make.width.equalTo(18)
        }
        
        addressLabel.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).inset(-10)
            make.left.equalTo(addressIcon.snp.right).inset(-5)
            make.right.equalToSuperview().inset(5)
        }
    }
}
