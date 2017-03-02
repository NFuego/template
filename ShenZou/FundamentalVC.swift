

import UIKit

class FundamentalVC : OptsVC , VCDecoration {

    override func buildOpts() {
        self.setNavHeader(title: "menu.fundamental",bgColor: UIColor(hex:"#CDCFFF"),textColor: UIColor(hex:"#8186ff"))
        menuOpts = [
                        MenuOpt(title:i18n("menu.bird"),targetVC:nil,icon:""),
                        MenuOpt(title:i18n("menu.kite"),targetVC:nil,icon:""),
                        MenuOpt(title:i18n("menu.frog"),targetVC:nil,icon:""),
                        MenuOpt(title:i18n("menu.fish"),targetVC:nil,icon:""),
                        MenuOpt(title:i18n("menu.square"),targetVC:nil,icon:""),
                        MenuOpt(title:i18n("menu.windmill"),targetVC:nil,icon:"")
        ]
    }
} 

// MARK:- setup
extension FundamentalVC {
    
}


// MARK:- actions
extension FundamentalVC {
    
}
