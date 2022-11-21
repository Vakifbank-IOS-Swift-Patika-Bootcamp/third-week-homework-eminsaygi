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
    
    // We used escaping clousere for asynchronous operations. We used escaping clousere in the completion completion block because we need to call it again after processing the model
    //MARK: - This is where we did the data extraction
    func getQuotesData(completion: @escaping(Result<Model, Error>)->()){
        
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
                print("Catch: WebService.swift : getQuotes")
                
            }
        }
        .resume()
    }

}
