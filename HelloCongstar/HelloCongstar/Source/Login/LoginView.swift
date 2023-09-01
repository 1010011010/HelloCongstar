import SwiftUI

struct LoginView: View {
    
    @ObservedObject
    var viewModel = LoginViewModel(loginRepository: LoginRepositoryMock())
    
    
    var body: some View {
        
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                TextField(text: $viewModel.userName) {
                    Text("User Name")
                }
                .background(Color.white)
                .accentColor(.white)
                
                SecureField("Enter a password", text: $viewModel.password)
                    .background(Color.white)
                
                Button("Login") {
                    Task {
                        await viewModel.login()
                    }
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
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
