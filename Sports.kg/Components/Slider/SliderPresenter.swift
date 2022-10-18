//
//  SliderPresenter.swift
//  Sports.kg
//
//  Created Eldiiar on 15/10/22.
//

import Foundation

protocol SliderPresenterProtocol: AnyObject {
    
}

class SliderPresenter {
    
    weak var view: SliderViewProtocol!
    var interactor: SliderInteractorProtocol!
    var router: SliderRouterProtocol!

    required init(view: SliderViewProtocol!) {
        self.view = view
    }
}

// MARK: - SliderPresenterProtocol
extension SliderPresenter: SliderPresenterProtocol {
    
}

// MARK: - SliderInteractorOutputProtocol
extension SliderPresenter: SliderInteractorOutputProtocol {
    
}
