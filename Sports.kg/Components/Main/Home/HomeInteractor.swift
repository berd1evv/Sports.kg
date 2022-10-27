//
//  HomeInteractor.swift
//  Sports.kg
//
//  Created Eldiiar on 4/10/22.
//

import Foundation

protocol HomeInteractorProtocol: AnyObject {
    func fetchSportAreas()
    func fetchSearchedSportAreas(search: String)
}

protocol HomeInteractorOutputProtocol: AnyObject {
    func didReceiveSportAreas(_ model: [HomeResults])
}

class HomeInteractor {
    
    weak var presenter: HomeInteractorOutputProtocol!
    let networkService = NetworkService.shared
    
    required init(presenter: HomeInteractorOutputProtocol!) {
        self.presenter = presenter
    }
    
}

extension HomeInteractor: HomeInteractorProtocol {
    func fetchSearchedSportAreas(search: String) {
        networkService.sendRequest(urlRequest: HomeNetworkRouter.searchSportAreas(search: search).createURLRequest(), successModel: Home.self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                print(model)
                guard let sportAreas = model.results else { return }
                self.presenter.didReceiveSportAreas(sportAreas)
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
    
    func fetchSportAreas() {
        networkService.sendRequest(urlRequest: HomeNetworkRouter.getSportAreas.createURLRequest(), successModel: Home.self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                print(model)
                guard let sportAreas = model.results else { return }
                self.presenter.didReceiveSportAreas(sportAreas)
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

