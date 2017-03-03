
import UIKit

class FundamentalVC : OptsVC , VCDecoration , OptsDecoration {
    override func buildOpts() {
        self.setNavHeader(title: "menu.fundamental",bgColor: UIColor(hex:"#9eabff"),textColor: .white)
        menuOpts = [
                        MenuOpt(title:i18n("menu.bird"),targetVC:BirdBase(),icon:""),
                        MenuOpt(title:i18n("menu.kite"),targetVC:KiteBase(),icon:""),
                        MenuOpt(title:i18n("menu.waterbomb"),targetVC:Waterbomb(),icon:""),
                        MenuOpt(title:i18n("menu.frog"),targetVC:nil,icon:""),
                        MenuOpt(title:i18n("menu.fish"),targetVC:nil,icon:""),
                        MenuOpt(title:i18n("menu.square"),targetVC:nil,icon:""),
                        MenuOpt(title:i18n("menu.windmill"),targetVC:nil,icon:"")
        ]
    }

    override func whenHighlight(_ cell: UITableViewCell) {

        let cell = cell as! MenuOptCell
        cell.backgroundColor = self.randomBGColor()
        cell.lbVal.textColor = .white
    }

    override func whenUnhighlight(_ cell: UITableViewCell) {
        let cell = cell as! MenuOptCell
        cell.backgroundColor = UIColor.white
        cell.lbVal.textColor = UIColor.options
    }

    override func showVC(_ vc:UIViewController){
//        self.pushViewController(vc,animated:true):
        self.navigationController?.pushViewController(vc,animated:true)

    }
}

// MARK:- setup
extension FundamentalVC {
    
}


// MARK:- actions
extension FundamentalVC {
    
}
