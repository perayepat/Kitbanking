import UIKit

class AccountSummaryCell: UITableViewCell{
    
    let typeLabel = UILabel()
    let divider = UIView()
    let nameLabel = UILabel()
    let balanceStackView = UIStackView()
    let balanceLabel = UILabel()
    let balanceAmountLabel = UILabel()
    
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
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.preferredFont(forTextStyle: .body)
        nameLabel.adjustsFontForContentSizeCategory = true
        nameLabel.text = "Account Name"
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(divider)
        contentView.addSubview(typeLabel) // In a table view cell the content view is the important view
        
        balanceStackView.translatesAutoresizingMaskIntoConstraints = false
        
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.font = UIFont.preferredFont(forTextStyle: .body)
        balanceLabel.adjustsFontForContentSizeCategory = true
        balanceLabel.text = "Some balance"
        
        balanceAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceAmountLabel.font = UIFont.preferredFont(forTextStyle: .body)
        balanceAmountLabel.adjustsFontForContentSizeCategory = true
        balanceAmountLabel.text = "$$$"
        
        contentView.addSubview(balanceStackView)
        balanceStackView.addArrangedSubview(balanceLabel)
        balanceStackView.addArrangedSubview(balanceAmountLabel)
        balanceStackView.axis = .vertical
        balanceStackView.alignment = .trailing
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
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: divider.leadingAnchor),
            nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: divider.bottomAnchor, multiplier: 2),
        ])
        
        NSLayoutConstraint.activate([
            trailingAnchor.constraint(equalToSystemSpacingAfter: balanceStackView.trailingAnchor, multiplier: 5),
            balanceStackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 4)
        ])
    }
}
