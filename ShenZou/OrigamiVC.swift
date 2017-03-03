import SnapKit
import Foundation
import UIKit
import CarouselSwift

import RxSwift
import RxCocoa


class OrigamiVC: UIViewController, CarouselViewDelegate, CarouselViewDataSourse {

    // Var
    let carousel = CarouselView()
    let dpg = DisposeBag()
    var views = [UIView]()
    var currentViewCount = 0

    // UI Comps
    var leftBtn:UIButton!
    var rightBtn:UIButton!
    public var buttonHeight = 44
    public var bottomOffset = 44
    


    override func viewDidLoad() {

        self.buildViews()
        self.setup()
        self.buildBtns()
        self.bindPagerBtns()
        self.checkBtnState()
    }

    override func viewDidAppear(_ animated: Bool) {
//        print(self.view.frame) //(0.0, 44.0, 320.0, 524.0)   // 320 x 568
    }
}


// MARK: - UI helper
extension OrigamiVC {
    public func buildViews(){
       
    }
    
    public func setup(){
        self.view.backgroundColor = .white
        view.addSubview(carousel)
        carousel.snp.makeConstraints { (make) in
            make.size.equalToSuperview()
        }
//        carousel.type = .loop//
        carousel.dataSource = self  //

//        carousel.autoScroll(2, increase: true)
        carousel.delegate = self

//        carousel.scrollTo(cell: 9)
        carousel.cellPerPage = 1

        carousel.reload()

    }

    public func buildBtns(){
        // Buttons
        let iconFt = UIFont.icon(from: .MaterialIcon, ofSize: 24)
        leftBtn = UIButton()
        rightBtn = UIButton()
        leftBtn.setTitleColor(.black, for: .normal)
        rightBtn.setTitleColor(.black, for: .normal)
        leftBtn.titleLabel!.font = iconFt
        rightBtn.titleLabel!.font = iconFt
//        leftBtn.setTitle(String.fontMaterialIcon("keyboard.arrow.left"), for: .normal)
//        rightBtn.setTitle(String.fontMaterialIcon("keyboard.arrow.right"), for: .normal)
        leftBtn.setImage(UIImage(named:"back"), for: .normal)
        rightBtn.setImage(UIImage(named:"right"), for: .normal)
        leftBtn.setImage(UIImage(named:"back2"), for: .highlighted)
        rightBtn.setImage(UIImage(named:"right2"), for: .highlighted)
//        leftBtn.setImage(UIImage(named:"back")),for: .

//        leftBtn.setBackgroundImage(UIImage(color:UIColor.dance), for: .normal)
//        leftBtn.setBackgroundImage(UIImage(color:UIColor.ocean), for: .highlighted)
//        rightBtn.setBackgroundImage(UIImage(color:UIColor.dance), for: .normal)
//        rightBtn.setBackgroundImage(UIImage(color:UIColor.ocean), for: .highlighted)

        self.view.addSubview(leftBtn)
        self.view.addSubview(rightBtn)

        leftBtn.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view.snp.bottom).offset(-bottomOffset)
            make.leading.equalTo(self.view)
            make.trailing.equalTo(self.view.snp.centerX)
            make.height.equalTo(buttonHeight)
        }

        rightBtn.snp.makeConstraints { (make) in
//            make.top.equalTo(tableView.snp.bottom)
//            make.bottom.equalTo(self.view.snp.bottom)

//            make.bottom.equalToSuperview()
//            make.height.equalTo(btnHeight)
//            make.width.equalToSuperview()

//            make.leading.equalTo(self.view.snp.centerX)
//            make.trailing.equalTo(self.view)

            make.bottom.equalTo(self.view.snp.bottom).offset(-bottomOffset)
            make.leading.equalTo(self.view.snp.centerX)
            make.trailing.equalTo(self.view)
            make.height.equalTo(buttonHeight)
        }
    }
    
    public func bindPagerBtns(){
        leftBtn.rx.tap.subscribe(onNext:{ evt in
//            if self.currentPage >= self.lastPage {
//                self.showAlert(msg: lastPageMsg)
//            } else {
//                self.loadDataForPage(page: self.currentPage + 1)
//            }

            if self.currentViewCount == 0 {

                // this is first view
            } else {
               self.currentViewCount -= 1
                self.carousel.scrollTo(cell: self.currentViewCount,animated:true)
            }

           }).addDisposableTo(dpg)

        rightBtn.rx.tap.subscribe(onNext:{ evt in
//            if self.currentPage == 1 {
//                self.showAlert(msg: noMorePageMsg)
//            } else {
//                self.loadDataForPage(page: self.currentPage - 1)
//            }
            if self.currentViewCount == self.views.count {

            } else {
                self.currentViewCount += 1
                self.carousel.scrollTo(cell: self.currentViewCount,animated:true)
            }

           }).addDisposableTo(dpg)
    }

        // CarouselViewDataSourse
    func numberOfView(_ carousel:CarouselView) -> Int {
            return views.count
    }
    
    func carousel(_ carousel:CarouselView, viewForIndex index:Int) -> UIView? {
       return views[index]
    }

//    func carouselDidScroll(_ carousel: CarouselView) {
//        print(currentViewCount)
//    }

    func carousel(_ carousel: CarouselView, didScrollFrom from: Int, to: Int) {
        currentViewCount = to
        checkBtnState()
        
//        print("\(currentViewCount) \(from) \(to)" )
    }

    func checkBtnState(){
        if self.currentViewCount == 0 {
            self.leftBtn.isHidden = true
        } else {
            self.leftBtn.isHidden = false
        }

        print("\(currentViewCount)  \(self.views.count)")
        if self.currentViewCount == self.views.count - 1 {
            self.rightBtn.isHidden = true
        } else {
            self.rightBtn.isHidden = false
        }
    }
} // fin UIHelper



