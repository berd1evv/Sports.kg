//
//  BookInteractor.swift
//  Sports.kg
//
//  Created Eldiiar on 15/10/22.
//

import Foundation

protocol BookInteractorProtocol: AnyObject {
    
}

protocol BookInteractorOutputProtocol: AnyObject {
    
}

class BookInteractor {
    
    weak var presenter: BookInteractorOutputProtocol!
    
    required init(presenter: BookInteractorOutputProtocol!) {
        self.presenter = presenter
    }
    
}

extension BookInteractor: BookInteractorProtocol {
    
}

