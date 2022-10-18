//
//  SliderViewController.swift
//  Sports.kg
//
//  Created Eldiiar on 15/10/22.
//

import UIKit

protocol SliderViewProtocol: AnyObject {
    
}

class SliderViewController: UIViewController {
    
    var presenter: SliderPresenterProtocol!
    private let configurator: SliderConfiguratorProtocol = SliderConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(with: self)
    }
}

// MARK: - SliderViewController
extension SliderViewController: SliderViewProtocol {
    
}
