//
//  NetworkManager.swift
//  MVVM taco generator
//
//  Created by Harriette Berndes on 06/07/2021.
//

import Foundation

class NetworkManager {
    static func getRandomTaco(completion: @escaping (Taco) -> Void) {
        let endpoint = "http://taco-randomizer.herokuapp.com/random/"
        // let url = URL(string: endpoint)
        let session = URLSession.shared
        if let url = URL(string: endpoint) {
            let dataTask = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("there is an error")
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    print(" response isn't a http response obj or code isn't good")
                    return
                }
                guard let mime = httpResponse.mimeType, mime == ("application/json") else {
                    print("response isn't json as expected")
                    return
                }
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    if let tacoData = try? jsonDecoder.decode(Taco.self, from: data) {
                        completion(tacoData)
                    }
                }
            }
            dataTask.resume()
        }
    }
}
