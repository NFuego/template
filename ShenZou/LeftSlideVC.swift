

import UIKit
import SnapKit
import RxSwift
import RxCocoa

struct MenuOpt {
    var title : String!
    var targetVC : UIViewController?
    var icon : String?
}


class LeftSlideVC : UIViewController {

    var menuOpts:[MenuOpt]!
    
    var optsTableView:UITableView!
    
    // SubPages
    static let basicVC = UINavigationController(rootViewController:OrigamiVC())
    static let welcomeVC = UINavigationController(rootViewController: WelcomeVC())
    
    let dbg = DisposeBag()

    override func viewDidLoad() {

        self.setup()
            menuOpts = [MenuOpt(title:"",targetVC:LeftSlideVC.basicVC,icon:"")
        ]
    } // fin viewDidLoad
} // fin LeftSlideVC

// MARK- UI Setup
extension LeftSlideVC {
    func newBtn(str:String)->UIButton {
        let btn = UIButton()
        btn.setTitle(str, for: .normal)
        btn.setTitleColor(.black, for: .normal)
        self.view.addSubview(btn)
        return btn
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
    }
}


// MARK: - UITableView Delegate
extension LeftSlideVC : UITableViewDelegate  {
    func reloadTableView(){
       optsTableView.delegate = self
       optsTableView.dataSource = self
       optsTableView.reloadData()
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuOptCell") as! MenuOptCell
//        cell.prepareForReuse()
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuOptCell", for: indexPath) as! MenuOptCell

        cell.separatorInset = .zero
        cell.layoutMargins = .zero

        if indexPath.row == 0 {
            cell.updateAsHeader(opt: self.menuOpts[indexPath.row])
        } else if indexPath.row == 1 || indexPath.row == 7 || indexPath.row == 9 {
            cell.updateAsSubHeader(opt: self.menuOpts[indexPath.row])
        } else if indexPath.row == 12 {
            // logout
            cell.update(opt: self.menuOpts[indexPath.row])
        } else {
            cell.update(opt: self.menuOpts[indexPath.row])
            
        }
        return cell
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.menuOpts.count
    }

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height = 50
        if indexPath.row == 0 {
            height = 90
        }
       return CGFloat(height)
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath.row)
//        let row = indexPath.row
//        if row == 1 || row == 7 || row == 9 {
//        } else {
//            (tableView.cellForRow(at: indexPath) as! MenuOptCell).setSelectedBg()
//        }
        let selectedOpt = menuOpts[indexPath.row]
        self.slideMenuController()?.changeMainViewController(selectedOpt.targetVC!, close: true)

    } // fin tableView

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

extension LeftSlideVC : UITableViewDataSource {
    
}
