import SwiftUI

struct LoginView: View {
    
    @ObservedObject
    var viewModel = LoginViewModel(loginRepository: LoginRepositoryMock())
    
    
    var body: some View {
        
        ZStack {

            Color.black
                .ignoresSafeArea()
            
            if viewModel.isLoading {
                
                ProgressView()
                    .offset(CGSize(width: 0, height: -100))
                    .padding()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                
            }
            
            Group {
                VStack(spacing: 20) {
                    
                    Image(systemName: "swift")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                        .padding(.top, 100)
                    
                    Spacer()
                    
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
                    Spacer()
                }
                .padding()
            }
        }
        .sheet(item: $viewModel.user) { user in
            VStack {
                Text("Hello \(user.name) \(user.lastName)")
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
