//
//  NetworkController.swift
//  UmaCooks
//
//  Created by Madhusudhan.Putta on 14/04/23.
//

import Foundation

open class NetworkController {

    public init() {

    }

    public func fetchResponse<ModelType: Decodable>(url: URL, queryItems: [URLQueryItem]?, headers: [String: String] = Header().headers, body: JSONBody = JSONBody(Empty()), method: URLRequest.HTTPMethod, completion: @escaping (Result<ModelType, Error>) -> Void) {

        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else { return }
        if urlComponents.queryItems == nil {
            urlComponents.queryItems = queryItems
        } else if let queryItems {
            urlComponents.queryItems?.insert(contentsOf: queryItems, at: 0)
        }

        let urlHTTPRequest = URLHTTPRequest(urlComponents: urlComponents, method: method, headers: headers)
        performRequest(request: urlHTTPRequest, body: body, completion: completion)
    }

    func performRequest<ModelType: Decodable>(request: any HTTPRequest, body: JSONBody, completion: @escaping (Result<ModelType, Error>) -> Void) {

        var urlRequest = URLRequest(url: request.urlComponents.url!)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.headers
        if request.method == .post {
            urlRequest.httpBody = try? body.encode()
        }

        URLSession.shared.dataTask(with: urlRequest) { (data, urlResponse, error) in
            if let data = data {

                debugPrint(String(data: data, encoding: .utf8)!)
                let jsonDecoder = JSONDecoder()

                do {
                    let result = try jsonDecoder.decode(ModelType.self, from: data)
                    completion(.success(result))
                } catch {
                    debugPrint(error.localizedDescription)
                    completion(.failure(error))
                }
            }
        }.resume()
    }

    /*
    public func fetchResponse<ModelType: Decodable>(url: URL, queryItems: [URLQueryItem]?, headers: [String: Any] = Headers().defaultHeaders, body: JSONBody, method: URLRequest.HTTPMethod, completion: @escaping (Result<ModelType, Error>) -> Void) {

        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else { return }
        if urlComponents.queryItems == nil {
            urlComponents.queryItems = queryItems
        } else if let queryItems {
            urlComponents.queryItems?.insert(contentsOf: queryItems, at: 0)
        }

        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = method.rawValue

        for (key, value) in headers {
            urlRequest.addValue(value as! String, forHTTPHeaderField: key)
        }

        if method == .post {
            urlRequest.httpBody = try? body.encode()
        }

        URLSession.shared.dataTask(with: urlRequest) { (data, urlResponse, error) in
            if let data = data {

                debugPrint(String(data: data, encoding: .utf8)!)
                let jsonDecoder = JSONDecoder()

                do {
                    let result = try jsonDecoder.decode(ModelType.self, from: data)
                    completion(.success(result))
                } catch {
                    debugPrint(error.localizedDescription)
                    completion(.failure(error))
                }
            }
        }.resume()

    }*/

}
