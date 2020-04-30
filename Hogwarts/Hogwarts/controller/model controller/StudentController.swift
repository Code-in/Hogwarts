//
//  PostController.swift
//  Reddit
//
//  Created by Pete Parks on 4/29/20.
//  Copyright © 2020 Pete Parks. All rights reserved.
//

import Foundation
import UIKit.UIImage

class StudentController {
    
    //static let baseURL = URL(string: "https://www.potterapi.com/v1/characters/?key=$2a$10$IG4NQGvmFsaSKm7nJLkKsOBq0Uxv9q2NFBcLDo39AFbbfvEzZBT96")
    
    static let baseURL = URL(string: "https://www.potterapi.com" )
    static let versionEndpoint = "v1"
    static let studentEndpoint = "characters"
    static let querykeyItem = "key"
    static let queryValueItem = "$2a$10$IG4NQGvmFsaSKm7nJLkKsOBq0Uxv9q2NFBcLDo39AFbbfvEzZBT96"
    
    static func fetchStudent(completion: @escaping (Result<[Student], StudentError>) -> Void) {
        
        guard let baseURL = self.baseURL else { return completion(.failure(.invalidURL)) }
        print("baseURL: \(baseURL)")
        let categoriesURL = baseURL.appendingPathComponent(versionEndpoint).appendingPathComponent(studentEndpoint)
        print("categoriesURL: \(categoriesURL)")
        var components = URLComponents(url: categoriesURL, resolvingAgainstBaseURL: true)
        
        components?.queryItems = [URLQueryItem(name: querykeyItem, value: queryValueItem)]
        
        guard let finalURL = components?.url else { return completion(.failure(.invalidURL)) }
        
        print("finalURL: \(finalURL)")
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
                return completion(.failure(.thrownError(error)))
            }
            guard let data = data else { return completion(.failure(.noData)) }
            
            do {
                let students = try JSONDecoder().decode([Student].self, from: data)
            
                for student in students {
                    print("Student: \(student)")
                }
                return completion(.success(students))
                
                
            } catch let e {
                print(e.localizedDescription)
                completion(.failure(.thrownError(e)))
            }
            
        }.resume()
        
    }
    
    /*
    static func fetchThumbnail(student: Student, completion: @escaping (Result<UIImage, StudentError>) -> Void) {
        guard let thumbnailURL = URL(string: post.thumbnail) else { return completion(.failure(.invalidURL)) }
        
        URLSession.shared.dataTask(with: thumbnailURL) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
                return completion(.failure(.thrownError(error)))
            }
            
            // Check the session data
            guard let data = data else { return completion(.failure(.noData)) }
            
            // load UIImage from data
            guard let image = UIImage(data: data) else { return completion(.failure(.unableToDecode)) }
            
            // success return image via the completion handler Result success with an image
            return completion(.success(image))
    
        }.resume()
    } // EoF
 */
}
