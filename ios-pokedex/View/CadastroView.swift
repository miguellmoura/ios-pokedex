import SwiftUI

struct CadastroView: View {
    @Environment(\.dismiss) var dismiss
    @State private var nome = ""
    @State private var email = ""
    @State private var senha = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Cadastro")
                .font(.largeTitle)
                .bold()
            
            TextField("Nome", text: $nome)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Senha", text: $senha)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Cadastrar") {
                // Lógica de cadastro
                dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    CadastroView()
}
