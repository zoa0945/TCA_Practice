//
//  Model.swift
//  KMOOC_TCA
//
//  Created by Nam Hoon Jeong on 6/5/24.
//

import Foundation

struct KmoocList: Codable, Equatable {
    let list: [Items]
    
    enum CodingKeys: String, CodingKey {
        case list = "items"
    }
}

struct Items: Codable, Equatable {
    let className: String
    let classImage: String
    let orgName: String
    let startDate: String
    let endDate: String
    
    enum CodingKeys: String, CodingKey {
        case className = "name"
        case classImage = "course_image"
        case orgName = "org_name"
        case startDate = "enrollment_start"
        case endDate = "enrollment_end"
    }
}

struct KmoocDetail: Codable {
    let classId: String
    let className: String
    let classImage: String
    let orgName: String
    let professor: String
    let summary: String
    let category: String
    let startDate: String
    let endDate: String
    
    enum CodingKeys: String, CodingKey {
        case professor, summary
        case classId = "id"
        case className = "name"
        case classImage = "course_image"
        case orgName = "org_name"
        case category = "classfy_name"
        case startDate = "enrollment_start"
        case endDate = "enrollment_end"
    }
}
