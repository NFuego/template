
import UIKit
import SnapKit
import Moya
import SwiftyJSON
import SwiftIconFont

// 375 x 667
class WelcomeVC : UIViewController , VCDecoration {


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.setNavHeader(title: "menu.about",bgColor: nil,textColor: nil)
        setup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
} // fin LoginVC


// MARK:- Setup
extension WelcomeVC {
    func setup(){
        self.view.backgroundColor = .white
        
//        let lbFt = UIFont(name: "HelveticaNeue", size: 15)
//        let lbFt1 = UIFont(name: "HelveticaNeue-Thin", size: 15)
        let s = UILabel()
//        s.font = lbFt
        s.text = "THIS IS MY STYLE"
        s.textAlignment = .center
        self.view.addSubview(s)
        s.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.width.equalToSuperview()
            make.height.equalTo(30)
//            make.size.equalToSuperview()
        }
        
        let s2 = UILabel()
//        s2.font = lbFt1
        s2.text = "THIS IS MY STYLE2"
        s2.textAlignment = .center
        self.view.addSubview(s2)
        s2.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(30)
            make.width.equalToSuperview()
            make.height.equalTo(30)
//            make.size.equalToSuperview()
        }
    }
}


// MARK:- Actions
extension WelcomeVC {
}
