

import Foundation

open class AppOp {

    public class func sendMail(){
        let str = "biologic.production@gmail.com"
//        let str = "foo@example.com?cc=bar@example.com&subject=Greetings%20from%20Cupertino!&body=Wish%20you%20were%20here!"

        let url = URL(string: "mailto:\(str)")
        UIApplication.shared.openURL(url!)
    }
}
