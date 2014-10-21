//
//  FirstViewController.swift
//  TinyMessage
//
//  Created by JOE on 14-10-1.
//  Copyright (c) 2014年 JOE. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    let coreDB:CoreDBInterface = CoreDBInterface()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        coreDB.insertEntity("MessageEntity", eBlock: { (entity) -> () in
            if(entity is MessageEntity)
            {//类型判断及转换
                let tmpEnity:MessageEntity = entity as MessageEntity
                tmpEnity.content = "hei my messageEnity"
                tmpEnity.title = "hei title"
            }
        })        
//        self.getAllData()
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

