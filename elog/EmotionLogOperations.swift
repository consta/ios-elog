//
//  EmotionLogDAO.swift
//  elog
//
//  Created by Kanstantin Kachanouski on 10.02.22.
//

import Foundation
import SQLite

class EmotionLogOperations {
    
    private let db: Connection
    
    static var shared: EmotionLogOperations = {
        let instance = EmotionLogOperations()
        
        return instance
    }()
    
    private init() {
        let fileManager = FileManager.default
        
        let documentsPath = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(
            .documentDirectory,
            .userDomainMask,
            true)[0])
        
        let destinationSqlitePath = documentsPath.appendingPathComponent("sqlite.db").path
        
        let sourceSqlitePath = Bundle.main.path(forResource: "db", ofType: "sqlite")!

        if !fileManager.fileExists(atPath: destinationSqlitePath) {
            do {
                try fileManager.copyItem(atPath: sourceSqlitePath, toPath: destinationSqlitePath)
                print("Copied")
                print(destinationSqlitePath)
            } catch let error as NSError {
                print("Unable to create database \(error.debugDescription)")
            }
        }
        else {
            print("db file already present")
        }
        
        do {
            self.db = try Connection(documentsPath.appendingPathComponent("sqlite.db").path)
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }

    
    public func testOperation() {
        print("Button pressed")
        do {
            let entriesTable = Table("elog_entries")
            let count = try db.scalar(entriesTable.count)
            print ("count = \(count)")
        }
        catch {
            let e = error
            fatalError(e.localizedDescription)
        }
    }
    
    public func save(_ entry: EmotionLogEntry) -> EmotionLogEntry {
        let entriesTable = Table("elog_entries")
        let id =             Expression<Int>("id")
        let entry_date =     Expression<Date?>("entry_date")
        let entry_duration = Expression<Int>("entry_duration")
        let emotion_id =     Expression<Int>("emotion_id")
        do {
            let id = try entriesTable.insert()
        } catch let error as NSError {
            fatalError("error: \(error)")
        }
        return EmotionLogEntry()
    }
}
