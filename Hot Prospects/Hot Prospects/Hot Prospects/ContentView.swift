//
//  ContentView.swift
//  Hot Prospects
//
//  Created by Myat Thu Ko on 12/3/20.
//

import SwiftUI

enum NetworkError: Error {
    case badURL, requestFailed, unknown
}

struct ContentView: View {
//    This body can be used with method 1, 2, and 3
//    var body: some View {
//        Text("Hello, world!")
//            .onAppear {
//                let url = URL(string: "https://www.apple.com")!
//                URLSession.shared.dataTask(with: url) { data, response, error in
//                    if data != nil {
//                        print("We got data!")
//                    } else if let error = error {
//                        print(error.localizedDescription)
//                    }
//                }.resume()
//            }
//    }
    
//    1st way to write the method
//    func fetchData(from urlString: String) -> Result<String, NetworkError> {
//        .failure(.badURL)
//    }
    
//    2nd way to write the method
//    func fetchData(from urlString: String, completion: (Result<String, NetworkError>) -> Void) {
//        completion(.failure(.badURL))
//    }
    
//    3rd way to write the method
//    func fetchData(from urlString: String, completion: @escaping (Result<String, NetworkError>) -> Void) {
//        DispatchQueue.main.async {
//            completion(.failure(.badURL))
//        }
//    }
    
    var body: some View {
        Text("Hello world!")
            .onAppear {
                self.fetchData(from: "https://www.apple.com") { result in
                    switch result {
                    case .success(let str):
                        print(str)
                    case .failure(let error):
                        switch error {
                        case .badURL:
                            print("Bad URL")
                        case .requestFailed:
                            print("Network error")
                        case .unknown:
                            print("Unknown error")
                        }
                    }
                }
            }
    }
    
//    4th way to write the method
    func fetchData(from urlString: String, completion: @escaping (Result<String, NetworkError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    let stringData = String(decoding: data, as: UTF8.self)
                    completion(.success(stringData))
                } else if error != nil {
                    completion(.failure(.requestFailed))
                } else {
                    completion(.failure(.unknown))
                }
            }
        }.resume()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
