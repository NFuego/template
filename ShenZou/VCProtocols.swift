//
//  VCProtocols.swift
//  SuccessfulOrigami
//
//  Created by zcon on 2017/3/2.
//  Copyright © 2017年 zcon. All rights reserved.
//

import Foundation

public protocol VCDecoration {
    func setNavHeader(title:String, bgColor:UIColor?, textColor:UIColor?)
}

extension VCDecoration where Self : UIViewController {
    func setNavHeader(title:String, bgColor:UIColor?, textColor:UIColor?){

        let bgColor = bgColor ?? UIColor.uiviewHeader
        let textColor = textColor ?? .white

        self.edgesForExtendedLayout = []
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.barTintColor = bgColor
        self.navigationController?.navigationBar.barStyle = .blackOpaque
        self.navigationController?.navigationBar.tintColor = textColor
        self.navigationController?.navigationBar.isTranslucent = false


        self.navigationController?.navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName: textColor,
             NSFontAttributeName: UIFont(name: "HelveticaNeue-Thin", size: 23)!]

        self.title = i18n(title)
        self.addLeftBarButtonWithImage( UIImage.icon(from: .MaterialIcon, code: "dehaze", imageSize: CGSize(width:30,height:30), ofSize: 30))
    }
}

