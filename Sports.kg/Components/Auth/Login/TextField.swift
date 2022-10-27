//
//  TextField.swift
//  Sports.kg
//
//  Created by Eldiiar on 27/10/22.
//

import UIKit

class TextField: UITextField {
    
    private lazy var imgView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        autocapitalizationType = .none
        autocorrectionType = .no
        layer.cornerRadius = 6
        leftView = UIView(frame: CGRect(x: 30, y: 30, width: 50, height: 100))
        leftViewMode = .always
        tintColor = .black
        addSubview(imgView)
        
        imgView.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview().inset(12)
            make.height.width.equalTo(20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpData(image: UIImage, placeholder: String) {
        imgView.image = image
        self.placeholder = placeholder
    }

}
