import Foundation

protocol LoginRepository {
    func doLogin(login: LoginModel) async -> Result<UserModel, Error>
}

class LoginRepositoryMock: LoginRepository {

    enum LoginError: Error {
        case invalidCredentials
    }

    func doLogin(login: LoginModel) async -> Result<UserModel, Error> {

        // wait for 3 seconds
        try? await Task.sleep(nanoseconds: 3_000_000_000)

        if login.userName.lowercased() == "jim" && login.password == "1234" {
            return .success(UserModel(name: "Jim", lastName: "Carrey"))
        } else {
            return .failure(LoginError.invalidCredentials)
        }
    }
}
