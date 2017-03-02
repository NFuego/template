//
//  ShenZouUrls.swift
//  ShenZou
//
//  Created by zcon on 2017/1/3.
//  Copyright © 2017年 zcon. All rights reserved.
//

import Foundation

public enum AppMode : String {
    case production = "production"
    case development = "development"

    public var description: String {
        return self.rawValue
    }
}


final class SuccOrigamiConfig : NSObject {

    static var appMode = AppMode.development


    
} // fin final class SzConfig
