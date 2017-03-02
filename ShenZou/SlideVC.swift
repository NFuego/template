//
//  SlideVC.swift
//  SuccessfulOrigami
//
//  Created by zcon on 2017/3/2.
//  Copyright © 2017年 zcon. All rights reserved.
//

import Foundation

class SlideVC : OptsVC {
    
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
}
