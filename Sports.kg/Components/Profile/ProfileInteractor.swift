//
//  ProfileInteractor.swift
//  Sports.kg
//
//  Created Eldiiar on 9/10/22.
//

import Foundation

protocol ProfileInteractorProtocol: AnyObject {
    
}

protocol ProfileInteractorOutputProtocol: AnyObject {
    
}

class ProfileInteractor {
    
    weak var presenter: ProfileInteractorOutputProtocol!
    
    required init(presenter: ProfileInteractorOutputProtocol!) {
        self.presenter = presenter
    }
    
}

extension ProfileInteractor: ProfileInteractorProtocol {
    
}

