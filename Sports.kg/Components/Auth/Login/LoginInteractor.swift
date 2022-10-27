//
//  LoginInteractor.swift
//  Sports.kg
//
//  Created Eldiiar on 18/10/22.
//

import Foundation

protocol LoginInteractorProtocol: AnyObject {
    func login(userName: String, password: String)
}

protocol LoginInteractorOutputProtocol: AnyObject {
    func didSignInSuccessfully()
}

class LoginInteractor {
    
    weak var presenter: LoginInteractorOutputProtocol!
    let networkService = NetworkService.shared
    let userDefaults = UserDefaultsService.shared
    
    required init(presenter: LoginInteractorOutputProtocol!) {
        self.presenter = presenter
    }
    
}

extension LoginInteractor: LoginInteractorProtocol {
    func login(userName: String, password: String) {
        let parameters: [String : Any] = [
            "username" : userName,
            "password" : password
        ]
        let data = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        guard let data = data else {
            return
        }
        networkService.sendRequest(urlRequest: AuthRouter.signIn(data: data).createURLRequest(), successModel: Login.self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                print(model)
                guard let access = model.access, let refresh = model.refresh else { return }
                self.userDefaults.save(token: access)
                self.userDefaults.saveRefreshToken(name: refresh)
                self.userDefaults.save(token: access)
                self.userDefaults.isSignedIn(signedIn: true)
                print(self.userDefaults.getToken())
                print(self.userDefaults.didSignedIn())
                self.presenter.didSignInSuccessfully()
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

