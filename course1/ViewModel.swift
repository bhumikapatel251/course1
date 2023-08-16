//
//  ViewModel.swift
//  course1
//
//  Created by Bhumika Patel on 03/08/23.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var courses: [Course] = []
    @Published  var smart: [Smart] = []
    
    func fetchCourses() {
        let url = URL(string: "https://api.jsonbin.io/v3/b/6458ec108e4aa6225e98d54d")!
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    
                    let jsonData = try decoder.decode(Content.self, from: data)
                    DispatchQueue.main.async {
                        self.smart = jsonData.record.result.collections.smart
                        self.courses = jsonData.record.result.index
                        print(jsonData)
                        for course in self.courses {
                            if let skillTags = course.skill_tags {
                                print("Course ID: \(course.id), Skill Tags Count: \(skillTags.count)")
                            } else {
                                print("Course ID: \(course.id), Skill Tags: Missing")
                            }
                        }

                    }
                } catch {
                    print("Error decoding JSON: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}
