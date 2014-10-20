//
//  CoreDataService.swift
//  TinyMessage
//
//  Created by JOE on 14-10-1.
//  Copyright (c) 2014年 JOE. All rights reserved.
//

import UIKit
import CoreData

class CoreDataService: NSObject {
    private(set) var managedObjectModel: NSManagedObjectModel = NSManagedObjectModel.mergedModelFromBundles(nil)
    var managedObjectContext: NSManagedObjectContext?
    var persistentStoreCoordinator: NSPersistentStoreCoordinator?{
        get{
            return self.persistentStoreCoordinator
        }
        set{
            self.persistentStoreCoordinator = self.getPersistentStoreCoordinator()
        }
    }
    
    override init() {
        super.init()
        managedObjectContext = self.getMangedObjectContext()
    }
    
    func getMangedObjectContext()->NSManagedObjectContext!
    {
        if(managedObjectContext != nil)
        {
            return managedObjectContext
        }
        let coordinator:NSPersistentStoreCoordinator? = persistentStoreCoordinator
        if(coordinator != nil)
        {
            var tempManageContent:NSManagedObjectContext = NSManagedObjectContext()
            tempManageContent.persistentStoreCoordinator = coordinator
            return tempManageContent
        }
        return nil
    }
    
    func getPersistentStoreCoordinator()->NSPersistentStoreCoordinator!
    {
        if (self.persistentStoreCoordinator != nil)
        {
            return self.persistentStoreCoordinator
        }
        else
        {
            let dbpath:String = applicationDocumentDirectory()! + "TinyMessage.sqlite"
            let storeUrl:NSURL? = NSURL.fileURLWithPath(dbpath);
            if(storeUrl != nil)
            {
                var tmpPersistentCoord:NSPersistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
                var error:NSErrorPointer = nil
                tmpPersistentCoord.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeUrl, options: nil, error: error)
                if(error == nil)
                {
                    return tmpPersistentCoord
                }
                
            }
            return nil
        }
    }
    
    
    func applicationDocumentDirectory()->String?
    {
        return NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).last as String!
    }
}