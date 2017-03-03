
import Foundation

class BirdBase : OrigamiVC {

    override public func buildViews(){
        views = [
            UIImageView(image: UIImage(named: "1")),
            UIImageView(image: UIImage(named: "1")),
            UIImageView(image: UIImage(named: "1")),
            UIImageView(image: UIImage(named: "2"))
        ]
    }
}
