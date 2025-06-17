import Foundation
import SwiftUI

class PokemonDetailViewModel: ObservableObject {
    
    @Published var detail: PokemonDetail?
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    
    private let service = PokeAPIDetailService()
    
    func loadDetail(from url: String) {
        isLoading = true
        errorMessage = nil
        
        service.fetchPokemonDetail(url: url) { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let detail):
                    self.detail = detail
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
