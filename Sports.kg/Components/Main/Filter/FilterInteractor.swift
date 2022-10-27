//
//  FilterInteractor.swift
//  Sports.kg
//
//  Created Eldiiar on 19/10/22.
//

import Foundation

protocol FilterInteractorProtocol: AnyObject {
    
}

protocol FilterInteractorOutputProtocol: AnyObject {
    
}

class FilterInteractor {
    
    weak var presenter: FilterInteractorOutputProtocol!
    
    required init(presenter: FilterInteractorOutputProtocol!) {
        self.presenter = presenter
    }
    
}

extension FilterInteractor: FilterInteractorProtocol {
    
}

