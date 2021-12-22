//
//  VideoModel.swift
//  Africa
//
//  Created by Nguyễn Hồng Lĩnh on 22/12/2021.
//

import Foundation

struct Video: Codable, Identifiable {
    var id: String
    var name: String
    var headline: String
    
    var thumbnail: String {
        return "video-\(id)"
    }
}
