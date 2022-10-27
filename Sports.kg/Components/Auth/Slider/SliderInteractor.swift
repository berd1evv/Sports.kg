//
//  SliderInteractor.swift
//  Sports.kg
//
//  Created Eldiiar on 15/10/22.
//

import Foundation

protocol SliderInteractorProtocol: AnyObject {
    func fetchSliders()
}

protocol SliderInteractorOutputProtocol: AnyObject {
    func didReceiveSliders(_ model: Slider)
}

class SliderInteractor {
    
    weak var presenter: SliderInteractorOutputProtocol!
    let networkService = NetworkService.shared
    
    required init(presenter: SliderInteractorOutputProtocol!) {
        self.presenter = presenter
    }
    
}

extension SliderInteractor: SliderInteractorProtocol {
    func fetchSliders() {
        networkService.sendRequest(urlRequest: SlidesNetworkRouter.getSlides.createURLRequest(), successModel: Slider.self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                print(model)
                self.presenter.didReceiveSliders(model)
            case .badRequest(let error):
                debugPrint(#function, error)
            case .failure(let error):
                debugPrint(#function, error)
            case .unauthorized(let error):
                debugPrint(#function, error)
            case .notFound(let error):
                debugPrint(#function, error)
            }
        }
    }
}

