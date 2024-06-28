//
//  DataFetcher.swift
//  SwiftUIDemo
//
//  Created by 吴伟 on 6/28/24.
//

import Foundation

actor DataFetcher {
    private var data: [String: String] = [:]

    // 获取数据的方法
    func fetchData() async {
        print("Fetching data...")

        // 创建并发任务
        let task1 = Task { [weak self] in
            return await self?.fetchFromSource1() ?? ""
        }
        
        let task2 = Task { [weak self] in
            return await self?.fetchFromSource2() ?? ""
        }

        // 等待任务完成
        let (result1, result2) = await (task1.value, task2.value)
        // 更新 actor 的状态
        data["source1"] = result1
        data["source2"] = result2
        
        print("Data fetched: \(data)")
    }

    // 从第一个源获取数据的模拟方法
    private func fetchFromSource1() async -> String {
        // 模拟网络请求的延迟
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        return "Data from source 1"
    }

    // 从第二个源获取数据的模拟方法
    private func fetchFromSource2() async -> String {
        // 模拟网络请求的延迟
        try? await Task.sleep(nanoseconds: 1_500_000_000)
        return "Data from source 2"
    }

    // 获取合并后的数据
    func getData() -> [String: String] {
        return data
    }
}
