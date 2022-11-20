//
//  Model.swift
//  QuotesApiApp
//
//  Created by Emin Saygı on 20.11.2022.
//

import Foundation

struct Welcome: Codable {
    let id, author, en: String
}




// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

//
// To read values from URLs:
//
//   let task = URLSession.shared.welcomeTask(with: url) { welcome, response, error in
//     if let welcome = welcome {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Welcome
struct Model: Codable {
    let id, author, en: String
}

// MARK: - Helper functions for creating encoders and decoders

