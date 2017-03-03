

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import GoogleMobileAds

public struct MenuOpt {

    
    var title : String!
    var targetVC : UIViewController?
    var icon : String?
    var header = false


    
    
    init(title:String,targetVC:UIViewController?,icon:String = "") {
        self.title = title
        self.targetVC = targetVC
        self.icon = icon
    }
    
}


open class OptsVC : UIViewController {

    var menuOpts:[MenuOpt]!
    
    var optsTableView:UITableView!
    
    // SubPages

    // Var
    var bannerView: GADBannerView!
    
    let dbg = DisposeBag()
    
    // Config Vars
    public var rowHeight = 65
    public var rowHeaderHeight = 90

    override open func viewDidLoad() {

        self.buildOpts()
        self.setup()

         if SuccOrigamiConfig.useAd {
            GADMobileAds.configure(withApplicationID: appId)

            bannerView = GADBannerView(adSize: kGADAdSizeBanner)
            bannerView.adUnitID = adGlobalBaseId
            bannerView.rootViewController = self
            let r = GADRequest()
            if SuccOrigamiConfig.appMode == .development {
                r.testDevices = [testId]
            }
            bannerView.load(r)
        }

    } // fin viewDidLoad
} // fin LeftSlideVC

// MARK- UI Setup
extension OptsVC {
    func buildOpts(){
    }

    func setup(){
        self.view.backgroundColor = .white
        optsTableView = UITableView()
        optsTableView.separatorStyle = .none
        optsTableView.bounces = false
//        optsTableView.isScrollEnabled = false
        optsTableView.register(MenuOptCell.self, forCellReuseIdentifier: "MenuOptCell")
        self.view.addSubview(optsTableView)
        optsTableView.snp.makeConstraints { (make) in
            make.width.height.equalToSuperview()
        }
        self.reloadTableView()
    }
}


// MARK: - UITableView Delegate
extension OptsVC: UITableViewDelegate  {
    func reloadTableView(){
       optsTableView.delegate = self
       optsTableView.dataSource = self
       optsTableView.reloadData()
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuOptCell") as! MenuOptCell
//        cell.prepareForReuse()
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuOptCell", for: indexPath) as! MenuOptCell

        cell.selectionStyle = .none
        cell.separatorInset = .zero
        cell.layoutMargins = .zero

        let opt = menuOpts[indexPath.row]

        if opt.header {
            cell.updateAsHeader(opt: self.menuOpts[indexPath.row])
        } else {
            cell.update(opt: self.menuOpts[indexPath.row])
        }
        
//        if indexPath.row == 0 {
//        } else if indexPath.row == 1 || indexPath.row == 7 || indexPath.row == 9 {
//            cell.updateAsSubHeader(opt: self.menuOpts[indexPath.row])
//        } else if indexPath.row == 12 {
            // logout
//            cell.update(opt: self.menuOpts[indexPath.row])
//        } else {
//            cell.update(opt: self.menuOpts[indexPath.row])
            
//        }
        return cell
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.menuOpts.count
    }

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height = rowHeight

        let opt = menuOpts[indexPath.row]
        if opt.header {
            height = rowHeaderHeight
        }

       return CGFloat(height)
    }

    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    }



    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath.row)
//        let row = indexPath.row
//        if row == 1 || row == 7 || row == 9 {
//        } else {
//            (tableView.cellForRow(at: indexPath) as! MenuOptCell).setSelectedBg()
//        }

//        print(tableView.cellForRow(at: indexPath)?.focusStyle.rawValue)
//        print(tableView.cellForRow(at: indexPath)?.selectionStyle.rawValue)

        let selectedOpt = menuOpts[indexPath.row]
        if let vc = selectedOpt.targetVC {
            EvtTracker.log(evtTitle: selectedOpt.title, contentType: vc.description)
            showVC( vc)
        }

//        (tableView.cellForRow(at: indexPath) as! MenuOptCell).contentView.backgroundColor = .gray
//        tableView.deselectRow(at: indexPath, animated: true)

    } // fin tableView

    public func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
            whenHighlight(cell)
        }
    }

    public func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath as IndexPath)  {
            whenUnhighlight(cell)
        }
    }


    // **  Deselecteion happens when a row is previous selected but user taps to other new row
//    public func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
//
//        (tableView.cellForRow(at: indexPath) as! MenuOptCell).contentView.backgroundColor = .white
//        return indexPath
//    }

//    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        (tableView.cellForRow(at: indexPath) as! MenuOptCell).contentView.backgroundColor = .white
//        print(indexPath)

//    }

    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
//        let row = indexPath.row
//        if row == 1 || row == 7 || row == 9 {
//        } else {
//            (tableView.cellForRow(at: indexPath) as! MenuOptCell).setSelectedBg()
//        }
        return indexPath
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

// MARK:- For Subclass to override
extension OptsVC {
    public func whenHighlight(_ cell:UITableViewCell){
        
    }

    public func whenUnhighlight(_ cell:UITableViewCell){
        
    }

    public func showVC(_ vc:UIViewController){
        self.slideMenuController()?.changeMainViewController(vc, close: true)
    }
}

extension OptsVC: UITableViewDataSource {
    
}


