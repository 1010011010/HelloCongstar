import Foundation
import SwiftUI

@MainActor
final class LoginViewModel: ObservableObject {

    struct UserItem: Identifiable {
        let id = UUID()
        let name: String
        let lastName: String
    }
    struct ErrorItem: Identifiable {
        let id = UUID()        
        let title: String
        let message: String
    }
    
    
    @Published var userName: String = ""
    @Published var password: String = ""
    
    @Published var user: UserItem?
    @Published var error: ErrorItem?

    
    private let loginRepository: LoginRepository

    init(loginRepository: LoginRepository) {
        self.loginRepository = loginRepository
    }

    func login() async {
        let loginModel = LoginModel(userName: userName, password: password)
        let result = await loginRepository.doLogin(login: loginModel)
        switch result {
        case .success(let user):
            let item = UserItem(name: user.name, lastName: user.lastName)
            self.user = item
        case .failure(_):
            self.error = ErrorItem(
                title: "Error",
                message: "Login failed"
            )
        }
    }
}
