import Foundation
import FirebaseAnalytics

final class EvtTracker {

    class func log(evtTitle:String,contentType:String){
        FIRAnalytics.logEvent(withName: kFIREventSelectContent, parameters: [
            kFIRParameterItemID: "id-\(evtTitle)" as NSObject,
            kFIRParameterItemName: evtTitle as NSObject,
            kFIRParameterContentType: "\(contentType)" as NSObject
            ])

    }

    // custome evts
//    class func log(){
//        FIRAnalytics.logEvent(withName: "share_image", parameters: [
//            "name": name as NSObject,
//            "full_text": text as NSObject
//            ])
//
//    }
}

