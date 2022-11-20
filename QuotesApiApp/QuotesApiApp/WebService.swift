//
//  WebService.swift
//  QuotesApiApp
//
//  Created by Emin Saygı on 20.11.2022.
//

import Foundation

class WebService {
    static let shared = WebService()
    private var session = URLSession.shared
    
    // Asenkron işlemler için escaping clousere kullandık. Modeli işledikten sonra tekrar çağırmamız gerektiği için completion tamamlama bloğu içerisinde escaping clousere kullandık
    func getMovie(completion: @escaping(Result<Model, Error>)->()){
        
        guard let url = URL(string: "https://programming-quotes-api.herokuapp.com/Quotes/random") else {return}
        
        session.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let result = try JSONDecoder().decode(Model.self, from: data)
                completion(.success(result.self))
            }
            catch {
                completion(.failure(error))
                print("Catch: WebServices.swift : getMovie")
                
            }
        }
        .resume()
    }

}
