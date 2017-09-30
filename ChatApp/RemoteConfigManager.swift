//
//  RemoteConfigManager.swift
//  ChatApp
//
//  Created by Andrew Piterov on 30/09/2017.
//  Copyright © 2017 Andrew Pierov. All rights reserved.
//

import UIKit
import FirebaseRemoteConfig

class RemoteConfigManager: NSObject {
    
    static let interval: TimeInterval = 10
    static var remoteConfigValues: [String: String] = [:]
    static var controlsToUpdate: [String: NSObject] = [:]
    
    static func remoteConfigInit(firstControl: UIButton){
        
        RemoteConfigManager.controlsToUpdate["loginButton"] = firstControl
        
        let remoteValues = RemoteConfig.remoteConfig()
        RemoteConfigManager.remoteConfigValues["loginButton"] = remoteValues["loginButton"].stringValue
        RemoteConfigManager.remoteConfigValues["photoButtonUpdate"] = remoteValues["photoButtonUpdate"].stringValue
        
        let remoteConfigDefaults: [String:NSObject] = [
            "loginButton":"login" as NSObject,
            "photoButtonUpdate":"update" as NSObject
        ]
        
        RemoteConfig.remoteConfig().setDefaults(remoteConfigDefaults)
        
        Timer.scheduledTimer(timeInterval: RemoteConfigManager.interval, target: self, selector: #selector(RemoteConfigManager.startFetching), userInfo: nil, repeats: true)
        
        remoteConfigDebugMode()
        startFetching()
    }
    
    static func startFetching(){
        
        let remoteValues = RemoteConfig.remoteConfig()
        RemoteConfigManager.remoteConfigValues["loginButton"] = remoteValues["loginButton"].stringValue
        RemoteConfigManager.remoteConfigValues["photoButtonUpdate"] = remoteValues["photoButtonUpdate"].stringValue
        
        RemoteConfig.remoteConfig().fetch(withExpirationDuration: RemoteConfigManager.interval){
            (status, error)
            in
            guard error == nil else{
                print("Error fetching remote config values \(String(describing: error))")
                return
            }
            
            RemoteConfig.remoteConfig().activateFetched()
            
            let fc = RemoteConfigManager.controlsToUpdate["loginButton"] as! UIButton
            print("loginButton value: \(String(describing: RemoteConfigManager.remoteConfigValues["loginButton"]))")
            fc.setTitle(RemoteConfigManager.remoteConfigValues["loginButton"], for: .normal)
        }
    }
    
    static func remoteConfigDebugMode(){
        let debugSettings = RemoteConfigSettings(developerModeEnabled: true)
        RemoteConfig.remoteConfig().configSettings = debugSettings!
    }
}
