
import Foundation

class BirdBase : OrigamiVC, VCDecoration {

    override public func buildViews(){
        self.setNavHeader(title: "menu.pajaro",bgColor: nil,textColor: nil)
        views = [
            UIImageView(image: UIImage(named: "1")),
            UIImageView(image: UIImage(named: "1")),
            UIImageView(image: UIImage(named: "1")),
            UIImageView(image: UIImage(named: "2"))
        ]
    }
}
