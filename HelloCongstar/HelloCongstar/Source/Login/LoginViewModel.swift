import Foundation
import SwiftUI

final class LoginViewModel: ObservableObject {

    struct Item: Identifiable {
        let id = UUID()        
        let name: String
        let lastName: String
    }
    
    
    @Published var userName: String = ""
    @Published var password: String = ""
    
    @Published var user: Item?
    
    
    private let loginRepository: LoginRepository

    init(loginRepository: LoginRepository) {
        self.loginRepository = loginRepository
    }

    @MainActor
    func login() async {
        let loginModel = LoginModel(userName: userName, password: password)
        let user = await loginRepository.doLogin(login: loginModel)
        let item = Item(name: user.name, lastName: user.lastName)
        self.user = item
    }
}
