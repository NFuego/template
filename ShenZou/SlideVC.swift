import Foundation

class SlideVC : OptsVC, OptsDecoration {

    
    static let aboutVC = UINavigationController(rootViewController: WelcomeVC())
    static let fundamentalVC = UINavigationController(rootViewController: FundamentalVC())
    

    override func buildOpts(){

        var header = MenuOpt(title:i18n("menu.about"),targetVC:SlideVC.aboutVC,icon:"")
        header.header = true
            menuOpts = [
                        header,
                        MenuOpt(title:i18n("menu.fundamental"),targetVC:SlideVC.fundamentalVC,icon:"")
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
} // fin SlideVC

// MARK: - SlideVC helper
extension SlideVC {

}
