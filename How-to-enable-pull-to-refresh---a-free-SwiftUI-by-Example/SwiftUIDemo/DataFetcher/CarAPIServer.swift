//
//  CarAPIServer.swift
//  SwiftUIDemo
//
//  Created by 吴伟 on 5/27/24.
//

import Foundation

protocol CarAPIServerProtocol {
    func loadCars(completion: @escaping ([CarModel]?)->(Void))
}



class CarAPIServer {
    func loadCars(page: Int, completion: @escaping ([CarModel]?)->(Void)) {
        if let url = URL(string: "https://661f5b2c16358961cd941ae5.mockapi.io/api/v1/cars?page=\(page)") {
            let session = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
                guard error == nil else {
                    completion(nil)
                    return
                }
                
                guard let jsonData = data else {
                    completion(nil)
                    return
                }
                
                do {
                    let model = try JSONDecoder().decode([CarModel].self, from: jsonData)         
                    completion(model)
                } catch {
                    completion(nil)
                }
            }
            session.resume()
        }
        
    }
}
