//
//  DetailCollectionViewCell.swift
//  Sports.kg
//
//  Created by Eldiiar on 9/10/22.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo.fill")
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews(imageView)
        
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getData(_ image: String?) {
        guard let imageURL = URL(string: image ?? "") else { return }
        imageView.sd_setImage(with: imageURL)
    }
    
    func setUpConstraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

