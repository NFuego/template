//
//  StringExt.swift
//  ShenZou
//
//  Created by zcon on 2016/12/29.
//  Copyright © 2016年 zcon. All rights reserved.
//

//import Foundation


extension String {
    static func tokenEnc(data:[String:String])->String{
        let jsonData = try! JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
        let encodedData = String.zEnc(jsonData)
        let encodedString = String.init(data: encodedData!, encoding: String.Encoding.utf8)!
        return encodedString
    }
    static func tokenDec(data:String)->[String:AnyObject] {
        let decodedResult = String.zDec(data.data(using: String.Encoding.utf8)!)
        let decodedResultObject = try! JSONSerialization.jsonObject(with: decodedResult!, options: .allowFragments) as! [String:AnyObject]
        return decodedResultObject
    }
}
