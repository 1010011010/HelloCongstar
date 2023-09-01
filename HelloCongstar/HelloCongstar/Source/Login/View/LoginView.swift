import SwiftUI

struct LoginView: View {
    
    @ObservedObject
    var viewModel = LoginViewModel(loginRepository: LoginRepositoryMock())
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            Text("Hello Congstar")
                .foregroundColor(.white)
            
            // TODO: implement textfields for username / password
            // TODO: implement Login Button to start login
            // TODO: show progress view while logging in
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
