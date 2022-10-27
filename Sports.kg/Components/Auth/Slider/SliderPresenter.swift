//
//  SliderPresenter.swift
//  Sports.kg
//
//  Created Eldiiar on 15/10/22.
//

import Foundation

protocol SliderPresenterProtocol: AnyObject {
    func getSliders()
    
    var slider: Slider? { get }
}

class SliderPresenter {
    
    var slider: Slider?
    
    weak var view: SliderViewProtocol!
    var interactor: SliderInteractorProtocol!
    var router: SliderRouterProtocol!

    required init(view: SliderViewProtocol!) {
        self.view = view
    }
}

// MARK: - SliderPresenterProtocol
extension SliderPresenter: SliderPresenterProtocol {
    func getSliders() {
        interactor.fetchSliders()
    }
}

// MARK: - SliderInteractorOutputProtocol
extension SliderPresenter: SliderInteractorOutputProtocol {
    func didReceiveSliders(_ model: Slider) {
        slider = model
        view.reloadData()
    }
}
