
import UIKit
import SnapKit
import Moya
import SwiftyJSON

class LoginVC : SzVC {

    let rp = RxMoyaProvider<SzAPI>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setup()
        auth()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
} // fin LoginVC


// MARK:- Setup
extension LoginVC {
    
    func setup(){
        self.view.backgroundColor = .green
        
    }
}


// MARK:- Actions
extension LoginVC {
    func auth(){
        rp
        .request(.Auth(name: "006", password: "006006"))
//        .filterSuccessfulStatusCodes()
//        .mapJSON()
        .subscribe(onNext: { (r) in
            self.slideMenuController()?.changeMainViewController(LeftSlideVC.inOneVC, close: true)

//            let result = String.tokenDec(data: json["result"])
//            let l = JSON(data:r.data)
//            let f = String.tokenDec(data: (l.dictionary?["result"]?.string)!)
//            l.rawString()
//            print(l.dictionary)
//            print(f)
        } , onError:{ (e) in

            print(e)
        } ).addDisposableTo(dpg)
    }
}



