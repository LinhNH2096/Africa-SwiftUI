//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Nguyễn Hồng Lĩnh on 10/12/2021.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(file: String, type: T.Type) -> [T] {
        // 1. Locale the json file
        guard let url = self.url(forResource: file, withExtension: "json")
        else {
            fatalError("Failed to locale \(file) in bundle")
        }
        // 2. Create data from URL
        guard let data = try? Data(contentsOf: url)
        else {
            fatalError("Failed to create data from \(url)")
        }
        // 3. Decode data
        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode([T].self, from: data)
        else {
            fatalError("Failed to decode data from \(file)")
        }
        return loaded
    }
}
