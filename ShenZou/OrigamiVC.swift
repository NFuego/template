import SnapKit
import Foundation
import UIKit
import CarouselSwift

class OrigamiVC: UIViewController, CarouselViewDelegate, CarouselViewDataSourse {
    
    // Var
    let carousel = CarouselView()
    var views = [
                    UIImageView(image: UIImage(named: "waterbomb1")),
                    UIImageView(image: UIImage(named: "waterbomb2"))
               
    ]
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = .blue
        self.setup()
    }
}


// MARK: - UI helper
extension OrigamiVC {
    
    func setup(){
        view.addSubview(carousel)
        carousel.snp.makeConstraints { (make) in
            make.size.equalToSuperview()
        }
        carousel.type = .loop// 设置内容 cell 是否循环
        carousel.dataSource = self  // 设置数据源 cell view
        carousel.reload()   // 加载数据

//        carousel.autoScroll(2, increase: true)  // 设置自动滚动
        carousel.delegate = self    // 设置滚动 delegate, 获取滚动进度

        carousel.scrollTo(cell: 1) // 滚动到指定 cell
        carousel.cellPerPage = 1 // 单页可以显示 view 数量

    }

        // CarouselViewDataSourse
    func numberOfView(_ carousel:CarouselView) -> Int {
            return views.count
    } // 返回用于显示 view 的总数
    
    func carousel(_ carousel:CarouselView, viewForIndex index:Int) -> UIView? {
       return views[index]
    }// index 对应的 view, nil则表示该 index 不显示
}



