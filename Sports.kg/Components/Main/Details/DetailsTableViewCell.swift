//
//  DetailsTableViewCell.swift
//  Sports.kg
//
//  Created by Eldiiar on 25/10/22.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var descLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        return label
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        
        addSubviews(
            titleLabel,
            descLabel
        )
        
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpData(model: Detail) {
        titleLabel.text = model.title
        descLabel.text = model.description
    }
    
    func setUpConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(6.5)
            make.left.right.equalToSuperview().inset(16)
        }
        
        descLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(2)
            make.left.right.equalToSuperview().inset(16)
        }
    }
    
}
