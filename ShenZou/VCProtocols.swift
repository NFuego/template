

import Foundation

// =========================================================
//
//  UIViewController
//
// =========================================================
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



// =========================================================
//
//  OptsVC
//
// =========================================================
public protocol OptsDecoration {
    func randomBGColor()->UIColor
}

extension OptsDecoration where Self : OptsVC {

    private var bgColors:[UIColor] {
        return [UIColor.uiviewHeader,UIColor.dance,UIColor.youngGirl,UIColor.soakedToRed,UIColor.sunset,UIColor.ocean,UIColor.freshPink]
    }

    func randomBGColor()->UIColor {
        return bgColors[Int(arc4random_uniform(UInt32(bgColors.count)))]
    }
}
