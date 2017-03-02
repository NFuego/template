import UIKit
import SnapKit

class MenuOptCell : UITableViewCell {
    var iconImg: UIImageView!
    var lbVal:UILabel!
    fileprivate var isHeader:Bool = false

    static let leadingOffset = 40

    override func prepareForReuse() {
        super.prepareForReuse()
//        print("reuse")
        if self.iconImg != nil {
            self.iconImg.image = nil
        }
        if self.lbVal != nil {
            self.lbVal.text = ""
        }
        self.contentView.backgroundColor = .white
        self.isHeader = false
    }
}

// MARK: Render methods
extension MenuOptCell {
    func update(opt:MenuOpt){
        self.layer.borderColor = UIColor.clear.cgColor
        if let iconName = opt.icon {
            iconImg = UIImageView()
            iconImg.image = UIImage(imageLiteralResourceName: iconName)
            self.contentView.addSubview(iconImg)
            iconImg.snp.makeConstraints { (make) in
                make.size.equalTo(30)
                make.centerY.equalToSuperview()
                make.leading.equalToSuperview().offset(10)
            }
        }

        lbVal = UILabel()
        lbVal.text = opt.title
        lbVal.tintColor = .black
        lbVal.adjustsFontSizeToFitWidth = true
        self.contentView.addSubview(lbVal)
        lbVal.snp.makeConstraints { (make) in
            make.width.equalTo(150)
            make.height.equalTo(14)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(MenuOptCell.leadingOffset + 10)
        }
    }

// ============================================================= Header
    func updateAsHeader(opt:MenuOpt){
        isHeader = true
        self.layer.borderColor = UIColor.clear.cgColor
//        self.contentView.backgroundColor = UIColor(hex: NSLocalizedString("color.light-bluegreen", comment: ""))
//        self.contentView.backgroundColor = UIColor.zs_mainColor()
        iconImg = UIImageView()
        iconImg.image = UIImage(imageLiteralResourceName: opt.icon!)
        self.contentView.addSubview(iconImg)
        iconImg.snp.makeConstraints { (make) in
            make.size.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(5)
        }

        lbVal = UILabel()
        lbVal.textAlignment = .center
        lbVal.text = opt.title
        lbVal.textColor = .white
        lbVal.adjustsFontSizeToFitWidth = true
        self.contentView.addSubview(lbVal)
        lbVal.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(20)
            make.top.equalTo(iconImg.snp.bottom).offset(5)
        }
    } // fin upateAsHeader

// ============================================================= sub header
    func updateAsSubHeader(opt:MenuOpt){
//        self.layer.borderColor = UIColor.clear.cgColor
//        self.contentView.backgroundColor = UIColor.zs_mainColor()
        iconImg = UIImageView()
        iconImg.image = UIImage(imageLiteralResourceName: opt.icon!)
        self.contentView.addSubview(iconImg)
        iconImg.snp.makeConstraints { (make) in
            make.size.equalTo(30)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
        }

        lbVal = UILabel()
        lbVal.text = opt.title
        lbVal.textColor = .white
        lbVal.adjustsFontSizeToFitWidth = true
        self.contentView.addSubview(lbVal)
        lbVal.snp.makeConstraints { (make) in
            make.width.equalTo(150)
            make.height.equalTo(14)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(MenuOptCell.leadingOffset + 10)
        }
    } // fin updateAsSubHeader
} 

// MARK: - set background color
extension MenuOptCell {
    func setSelectedBg(){
        if isHeader {
        self.contentView.backgroundColor = UIColor.zs_mainColor()
        } else {
            self.contentView.backgroundColor = UIColor.white
        }
    }
}
