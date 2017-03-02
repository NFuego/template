
import Foundation
import Moya
import Result

public enum SuccOrigamiURI {
    public static var baseURL : String {
        switch SuccOrigamiConfig.appMode {
        case .development:
            return "http://dev.zconhealth.com:1300/i-care"
        case .production:
            return ""
        }
//         SzConfig.appMode = .development {
//           return "http://dev.zconhealth.com:1300"
//        } else {
//           return ""
//        }
        
    }
}


public enum SzAPI {
    case Auth(name: String, password: String)

}

extension SzAPI : TargetType {
    
    public var baseURL: URL { return URL(string:SuccOrigamiURI.baseURL)!}

    public var path: String {
        switch self {
            case .Auth:
            return "/login"
        }

    }

    public var method: Moya.Method {
        switch self {
            case .Auth:
            return .post
        }
    }

    public var parameters: [String : Any]? {
        switch self {
        case let .Auth(name, password):

            var dic = ["username":name ,
                       "password":password,
                       "location":"P"]
            let token = String.tokenEnc(data: dic)
            dic["auth_token"] = token
            print(token)
            return dic
        }
        
    }

    public  var sampleData: Data {
        return Data()

    }

    public var task: Moya.Task {
        switch self {
            case .Auth:
                return .request
        }
    } // fin task

//    public var validate: Bool { get }

    
    
}
