import UIKit

class AccountSummaryCell: UITableViewCell{
    
    let typeLabel = UILabel()
    let divider = UIView()
    static let reuseIdentifier = String(describing: AccountSummaryCell.self)
    
    enum cellConfiguration: CGFloat{
        case rowHeight = 100
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension AccountSummaryCell{
    private func setup(){

        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        typeLabel.adjustsFontForContentSizeCategory = true
        typeLabel.text = "Account type"
                
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = appColor
        
        contentView.addSubview(divider)
        contentView.addSubview(typeLabel) // In a table view cell the content view is the important view
    }
    private func layout(){
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            typeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2)
        ])
        
        NSLayoutConstraint.activate([
            divider.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            divider.topAnchor.constraint(equalToSystemSpacingBelow: typeLabel.bottomAnchor, multiplier: 1),
            divider.widthAnchor.constraint(equalToConstant: 60),
            divider.heightAnchor.constraint(equalToConstant: 4)
        ])
    }
}
