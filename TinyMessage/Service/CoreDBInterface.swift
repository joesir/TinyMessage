//
//  CoreDBInterface.swift
//  TinyMessage
//
//  Created by JOE on 14-10-12.
//  Copyright (c) 2014年 JOE. All rights reserved.
//

import UIKit
import CoreData

class CoreDBInterface: NSObject {
    
    override init() {
        
    }
    
    func insertEntity(name:String, eBlock:(entity:AnyObject!)->())->NSError?
    {
        var error:NSError? = nil
        var context:NSManagedObjectContext = CoreDBService.shareService.managedObjectContext!
        var tmpEntity: AnyObject! = NSEntityDescription.insertNewObjectForEntityForName(name, inManagedObjectContext: context)
        
        if(tmpEntity != nil)
        {
          eBlock(entity: tmpEntity)
        }
        context.save(&error)
        return error
    }
    
    func updateEntity()
    {
        
    }
    
//    func deleteEnity(entity:NSManageObje)
//    {
//        
//    }
    
    func queryEnity(predicate:NSPredicate!,enityName:String)->AnyObject!
    {
        var request:NSFetchRequest = NSFetchRequest()
        var enity:NSEntityDescription = NSEntityDescription.entityForName(enityName, inManagedObjectContext: CoreDBService.shareService.managedObjectContext!)!
        request.predicate = predicate
        var error:NSError? = nil
        var result = CoreDBService.shareService.managedObjectContext?.executeFetchRequest(request, error: &error)
        if error == nil
        {
            return result
        }
        else
        {
            return nil
        }
    }
    
}
