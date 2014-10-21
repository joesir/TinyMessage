//
//  MessageEntity.swift
//  TinyMessage
//
//  Created by JOE on 14-10-19.
//  Copyright (c) 2014年 JOE. All rights reserved.
//

import Foundation
import CoreData

@objc(MessageEntity)

class MessageEntity: NSManagedObject {

    @NSManaged var content: String
    @NSManaged var title: String
}
