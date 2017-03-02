
import Foundation
import Typhoon
import RxSwift
import Moya
import SwiftyJSON

open class Assembly: TyphoonAssembly {

    let rp = RxMoyaProvider<SzAPI>()

//    open dynamic func viewController() -> AnyObject {
//        return TyphoonDefinition.withClass(AppDelegate.self) { definition in
//            definition!.injectProperty("foo", with: "bar")
////            definition!.i
//            } as AnyObject
//    }

//    open dynamic func mattressVC() -> AnyObject {
//        return TyphoonDefinition.withClass(MattressVC.self) { definition in
//            definition?.scope = TyphoonScope.singleton
//            definition?.injectProperty("rp", with: self.rp)
//        } as AnyObject
//    }
    
}
