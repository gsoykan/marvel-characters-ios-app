//
//  APIClient.swift
//  MarvelCharacters
//
//  Created by gurkan soykan on 8.06.2020.
//  Copyright © 2020 gurkan soykan. All rights reserved.
//

import Foundation

class APIClient {
    static let shared = APIClient()
    private init() {}
    
    let session = URLSession.shared
    
    func request<T: Codable>(router: APIRouter, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: Constants.Networking.baseURL + router.endpoint) else {
            completion(Result.failure(MCError.prematureError(reason: "Invalid URL scheme")))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = router.httpMethod
        request.setValue(Constants.Networking.contentTypeJSONValue, forHTTPHeaderField: Constants.Networking.contentTypeKey)
        let task = session.dataTask(with: request) { data, response, error in
            guard error == nil,
                let data = data else {
                    completion(Result.failure(MCError.clientError))
                    return
            }
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                completion(Result.failure(MCError.serverError))
                return
            }
            do {
                let model = try JSONDecoder().decode(T.self, from: data)
                completion(Result.success(model))
            } catch {
                completion(Result.failure(error))
            }
        }
        task.resume()
    }
}

