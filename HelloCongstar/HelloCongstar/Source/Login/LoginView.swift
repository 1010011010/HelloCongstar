import SwiftUI

struct LoginView: View {
    
    @ObservedObject
    var viewModel = LoginViewModel(loginRepository: LoginRepositoryMock())
    
    
    var body: some View {
        
        ZStack {
            Color.black
                    .ignoresSafeArea()

            VStack(spacing: 20) {

                TextField("Username", text: $viewModel.userName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                SecureField("Enter a password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                Button {
                    Task {
                        await viewModel.login()
                    }
                } label: {
                    ZStack {
                        Color.accentColor
                        Text("Login")
                                .foregroundColor(.white)
                    }
                            .cornerRadius(25)
                            .frame(height: 50)
                }
            }
                    .padding()
        }
        .sheet(item: $viewModel.user) { user in
            VStack {
                Text(user.name)
                Text(user.lastName)
            }
        }
        .alert(item: $viewModel.error) { errorItem in
            Alert(
                title: Text(errorItem.title),
                message: Text(errorItem.message)
            )
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
