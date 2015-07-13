//
//  BaseBuilder.swift
//  BLKWaterDelivery
//
//  Created by black9 on 09/07/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class BaseBuilder: NSObject, Builder {
   
    var completitionHandler:((result:Builder, objects:Array<AnyObject>)->Void)?
    var objectCreator:ObjectCreator?
    var parser = JSONParser()
    var remoteCommunicator:RemoteCommunicator?
    var dbManager:DBManager?
    var requestParameters:Dictionary<String,String>?
    var resultObjects:NSArray?
    
    override init ()
    {
        super.init()
        injectDependencies()
    }
    func buildWithCompletition(handler:(result:Builder, objects:Array<AnyObject>) -> Void)
    {
        loadParseableDataFromRemote()
        completitionHandler = handler;
    }
    func injectDependencies()
    {
        
    }
    func loadParseableDataFromRemote()
    {
        if let communicator = remoteCommunicator {
            if let params = self.requestParameters {
                communicator.loadDataWithParameters(params, callback: { (result) -> Void in
                    self.parseCommunicatorResult(result)
                })
            }
        }
    }
    func parseCommunicatorResult(result:String?) {
          let resultDictionary = parser.parse(result)
            if let objectsInfo = resultDictionary {
                createObjectsWithInfo(objectsInfo);
            }
    }
    func createObjectsWithInfo(objectInfo:Dictionary<String,JSON>)
    {
        if let creator = self.objectCreator {
            self.resultObjects = creator.createObjectsWithData(objectInfo)
            if let dbManager = self.dbManager {
                dbManager.save()
            }
            callCompletitionHandler()
        }
    }
    func callCompletitionHandler()
    {
        if let handler = self.completitionHandler {
            handler(result:self,objects: emptyArrayIfHereIsNoCreatedObjects()!)
        }
        completitionHandler = nil
    }
    func emptyArrayIfHereIsNoCreatedObjects() -> Array<AnyObject>?
    {
        var objects : Array<AnyObject>?
        if let result = self.resultObjects {
            objects = result as Array<AnyObject>;
        }
        else {
            objects = [AnyObject]()
        }
        return objects
    }
}
