import UIKit

class AccountSummaryHeaderView: UIView{
    @IBOutlet var contentVIew: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    /// The dfualt size a view would like to give itself 
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 144)
    }
    
    /// This is how you load a nib programatically
    private func commonInit() {
        let bundle = Bundle(for: AccountSummaryHeaderView.self)
        bundle.loadNibNamed("AccountSummaryHeaderView", owner: self, options: nil)
        addSubview(contentVIew)
        contentVIew.backgroundColor = appColor
        
        contentVIew.translatesAutoresizingMaskIntoConstraints = false
        contentVIew.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentVIew.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        contentVIew.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        contentVIew.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
