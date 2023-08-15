//
//  Model.swift
//  course1
//
//  Created by Bhumika Patel on 03/08/23.
//

import SwiftUI

import Foundation


struct Content: Codable {
    let record: Record
}

struct Record: Codable {
    let result: Result
}

struct Result: Codable {
    let index: [Course]
    let collections: Collections
}

struct Course: Codable, Identifiable,Hashable {
    let id: Int
        let title: String
        let educator: String
        let style_tags: [String]?
        let skill_tags: [String]?
        let curriculum_tags: [String]?
        let owned: Int
    // Add other properties as needed...
    var imageURL: URL? {
            // Replace "{course_id}" with the actual course_id from the JSON data
            URL(string: "https://d2xkd1fof6iiv9.cloudfront.net/images/courses/\(id)/169_820.jpg")
        }
//    enum SkillLevel: String, CaseIterable {
//        case beginner
//        case intermediate
//        case advanced
//        case unknown
//    }


//        var skillLevel: SkillLevel {
//            if let skillTags = skill_tags, !skillTags.isEmpty {
//                // Return the first skill level tag if available
//                if let tag = skillTags.first, let level = SkillLevel(rawValue: tag) {
//                    return level
//                }
//            }
//            // Return the default skill level for courses with nil skill_tags
//            return .unknown
//        }
//    var skillLevel: String {
//           return skill_tags?.first ?? "All"
//       }
}
struct Collections: Codable {
    let smart: [Smart]
    
}
struct Smart: Codable, Identifiable {
    let id, label, smart: String
    let courses: [Int]
    let isDefault, isArchive: Int
    let description: String

}
//enum skill_tags: String, Codable {
//    case advanced = "Advanced"
//    case beginner = "Beginner"
//    case empty = ""
//    case intermediate = "Intermediate"
//    case lateBeginner = "Late Beginner"
//    case lateIntermediate = "Late Intermediate"
//}
//extension Course {
//    var skillLevel: SkillLevel {
//        if let skillTags = skill_tags, !skillTags.isEmpty {
//            if let tag = skillTags.first, let level = SkillLevel(rawValue: tag) {
//                return level
//            }
//        }
//        return .unknown
//    }
//}
