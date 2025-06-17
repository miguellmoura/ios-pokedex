import SwiftUI

struct CadastroView: View {
    @State private var nome = ""
    @State private var email = ""
    @State private var senha = ""
    @State private var erro = ""
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 20) {
            Text("Cadastro").font(.largeTitle)

            TextField("Nome de usuário", text: $nome)
                .textFieldStyle(.roundedBorder)

            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .textFieldStyle(.roundedBorder)

            SecureField("Senha", text: $senha)
                .textFieldStyle(.roundedBorder)

            if !erro.isEmpty {
                Text(erro).foregroundColor(.red)
            }

            Button("Cadastrar") {
                if AuthService.shared.cadastrar(nome: nome, email: email, senha: senha) {
                    dismiss()
                } else {
                    erro = "Email já cadastrado"
                }
            }
        }
        .padding()
    }
}
