import Foundation
import SwiftUI

@MainActor
final class LoginViewModel: ObservableObject {
        
    @Published var userName: String = ""
    @Published var password: String = ""
    
    @Published var user: UserModel?
    
    private let loginRepository: LoginRepository
    
    init(loginRepository: LoginRepository) {
        self.loginRepository = loginRepository
    }
    
    func login() {
                
        let loginModel = LoginModel(userName: userName, password: password)
        let result = loginRepository.doLogin(login: loginModel)
                
        switch result {
        case .success(let user):
            self.user = user
        case .failure(let error):
           // TODO: handle error
            print("Error")
        }
    }
}
