import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var senha = ""
    @State private var erro = ""
    @State private var navegar = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Login").font(.largeTitle)

            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .textFieldStyle(.roundedBorder)

            SecureField("Senha", text: $senha)
                .textFieldStyle(.roundedBorder)

            if !erro.isEmpty {
                Text(erro).foregroundColor(.red)
            }

            Button("Entrar") {
                if AuthService.shared.login(email: email, senha: senha) {
                    navegar = true
                } else {
                    erro = "Credenciais inválidas"
                }
            }

            NavigationLink("Criar Conta", destination: CadastroView())
        }
        .padding()
        .navigationDestination(isPresented: $navegar) {
            HomeView() 
        }
    }
}
