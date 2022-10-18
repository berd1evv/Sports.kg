//
//  DetailsInteractor.swift
//  Sports.kg
//
//  Created Eldiiar on 9/10/22.
//

import Foundation

protocol DetailsInteractorProtocol: AnyObject {
    func fetchDetails()
}

protocol DetailsInteractorOutputProtocol: AnyObject {
    func didReceiveDetails(_ model: Details)
}

class DetailsInteractor {
    
    var id: Int
    
    weak var presenter: DetailsInteractorOutputProtocol!
    let networkService = NetworkService.shared
    
    required init(presenter: DetailsInteractorOutputProtocol!, id: Int) {
        self.presenter = presenter
        self.id = id
    }
    
}

extension DetailsInteractor: DetailsInteractorProtocol {
    func fetchDetails() {
        networkService.sendRequest(urlRequest: HomeNetworkRouter.getDetails(id: id).createURLRequest(), successModel: Details.self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                print(model)
                self.presenter.didReceiveDetails(model)
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

