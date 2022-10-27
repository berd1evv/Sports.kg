//
//  SliderViewController.swift
//  Sports.kg
//
//  Created Eldiiar on 15/10/22.
//

import UIKit

protocol SliderViewProtocol: AnyObject {
    func reloadData()
}

class SliderViewController: UIViewController {
    
    //collectionView
    
    private lazy var startButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    var presenter: SliderPresenterProtocol!
    private let configurator: SliderConfiguratorProtocol = SliderConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(with: self)
    }
}

// MARK: - SliderViewController
extension SliderViewController: SliderViewProtocol {
    func reloadData() {
        
    }
}
