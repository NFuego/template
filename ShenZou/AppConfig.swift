

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
    static var useAd = true
    static var author_mail = "biologic.production@gmail.com"


    
} // fin final class SzConfig
