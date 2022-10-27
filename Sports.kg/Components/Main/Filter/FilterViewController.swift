//
//  FilterViewController.swift
//  Sports.kg
//
//  Created Eldiiar on 19/10/22.
//

import UIKit

protocol FilterViewProtocol: AnyObject {
    
}

class FilterViewController: UIViewController {
    
    var presenter: FilterPresenterProtocol!
    private let configurator: FilterConfiguratorProtocol = FilterConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(with: self)
    }
}

// MARK: - FilterViewController
extension FilterViewController: FilterViewProtocol {
    
}
