import Foundation

class PokeAPIDetailService {
    
    func fetchPokemonDetail(url: String, completion: @escaping (Result<PokemonDetail, Error>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(PokemonDetail.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
}
