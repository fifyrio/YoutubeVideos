//
//  CarListViewModel.swift
//  SwiftUIDemo
//
//  Created by 吴伟 on 5/27/24.
//

import Foundation


@MainActor
class CarListViewModel: ObservableObject {
    var api: CarAPIServer
    
    var pageIndex: Int = 0
    
    init(api: CarAPIServer) {
        self.api = api        
    }
    
    @Published var dataList: [CarModel] = []
    
    /*
    func loadDataList() async {
        api.loadCars(page: pageIndex) { [weak self] (list) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if let data = list {
                    self.pageIndex += 1
                    self.dataList.append(contentsOf: data)
                }
            }
        }
    }
    */
    
    func fetchCars() async {
        do {
            let url = URL(string: "https://661f5b2c16358961cd941ae5.mockapi.io/api/v1/cars?page=\(pageIndex)")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedCars = try JSONDecoder().decode([CarModel].self, from: data)
            updateUI(with: decodedCars)
        } catch {
            print("Error fetching cars: \(error)")
        }
    }
    
    @MainActor
    func updateUI(with cars: [CarModel]) {
        self.pageIndex += 1
        self.dataList.append(contentsOf: cars)
    }
}
