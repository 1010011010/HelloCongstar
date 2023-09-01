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

    func login() async {
        let loginModel = LoginModel(userName: userName, password: password)
        user = await loginRepository.doLogin(login: loginModel)
    }
}
