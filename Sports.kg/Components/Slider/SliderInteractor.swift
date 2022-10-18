//
//  SliderInteractor.swift
//  Sports.kg
//
//  Created Eldiiar on 15/10/22.
//

import Foundation

protocol SliderInteractorProtocol: AnyObject {
    
}

protocol SliderInteractorOutputProtocol: AnyObject {
    
}

class SliderInteractor {
    
    weak var presenter: SliderInteractorOutputProtocol!
    
    required init(presenter: SliderInteractorOutputProtocol!) {
        self.presenter = presenter
    }
    
}

extension SliderInteractor: SliderInteractorProtocol {
    
}

