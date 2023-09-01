import Foundation

protocol LoginRepository {
    func doLogin(login: LoginModel) async -> UserModel
}

class LoginRepositoryMock: LoginRepository {

    func doLogin(login: LoginModel) async -> UserModel {
        if login.userName == "jim" && login.password == "1234" {
            return UserModel(name: "Jim", lastName: "Carrey")
        } else {
            return UserModel(name: "Unknown", lastName: "Unknown")
        }
    }
}
