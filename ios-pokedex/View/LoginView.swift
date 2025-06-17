import SwiftUI

// Tela de Login
struct LoginView: View {
    @State private var email = ""
    @State private var senha = ""
    @State private var isLoggedIn = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Pokédex Login")
                    .font(.largeTitle)
                    .bold()
                
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                SecureField("Senha", text: $senha)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Entrar") {
                    // Aqui você faria a lógica de autenticação
                    isLoggedIn = true
                }
                .buttonStyle(.borderedProminent)
                
                NavigationLink("Cadastre-se", destination: CadastroView())
            }
            .padding()
            .navigationDestination(isPresented: $isLoggedIn) {
                HomeView()
            }
        }
    }
}

// Preview principal (para rodar no Canvas)
#Preview {
    LoginView()
}
