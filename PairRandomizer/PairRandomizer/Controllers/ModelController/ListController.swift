//
//  ListController.swift
//  PairRandomizer
//
//  Created by Alex Kennedy on 10/16/20.
//  Copyright © 2020 Alex Kennedy. All rights reserved.
//

import Foundation

class ListController {
    
    // MARK: - shared instance
    static let shared = ListController()
    
    // MARK: - source of truth
    var objects: [List] = []
    
    init() {
        loadFromPersistentStore()
    }
    
    // MARK: - crud and helper functions
    func createListObject(object: String) {
        let newObject = List(object: object)
        objects.append(newObject)
        saveToPersistenStore()
    }
    
    func deleteObject(object: List) {
        guard let index = objects.firstIndex(of: object) else { return }
        objects.remove(at: index)
        saveToPersistenStore()
    }
    
    func fileURL() -> URL{
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = "list.json"
        let documentsDirectoryURL = urls[0].appendingPathComponent(fileName)
        return documentsDirectoryURL
    }
    
    func saveToPersistenStore() {
        let jsonEncoder = JSONEncoder()
        do {
            let data = try jsonEncoder.encode(objects)
            try data.write(to: fileURL())
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadFromPersistentStore() {
        let jsonDecoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let objects = try jsonDecoder.decode([List].self, from: data)
            self.objects = objects
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func randomize() {
        objects.shuffle()
        
    }
    
}
