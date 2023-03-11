import UIKit
import SwiftUI

class AccountSummaryViewController: UIViewController{

    var accounts: [AccountSummaryCell.ViewModel] = []
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
    }
}

extension AccountSummaryViewController:UITableViewDelegate, UITableViewDataSource {
    private func setup(){
       setupTableView()
        setupHeaderTableView()
        fetchData()
    }
    
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self // We are going to supply the data for this table view
        
        tableView.register(AccountSummaryCell.self, forCellReuseIdentifier: AccountSummaryCell.reuseIdentifier)
        tableView.rowHeight = AccountSummaryCell.cellConfiguration.rowHeight.rawValue
        tableView.tableFooterView = UIView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
    }
    
    private func setupHeaderTableView(){
        let header = AccountSummaryHeaderView(frame: .zero)
        
        var size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        header.frame.size = size
        
        tableView.tableHeaderView = header
    }
    
    private func layout(){
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        accounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard !accounts.isEmpty else {return UITableViewCell() }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummaryCell.reuseIdentifier, for: indexPath) as? AccountSummaryCell else {return UITableViewCell()}
        let account  = accounts[indexPath.row]
        cell.configure(with: account)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension AccountSummaryViewController{
    private func fetchData(){
        let savings = AccountSummaryCell.ViewModel(accountType: .Banking, accountName: "Savings", balance: 300.00)
        let visa = AccountSummaryCell.ViewModel(accountType: .CreditCard, accountName: "Visa Avion Card", balance: 500.00)
        let investment = AccountSummaryCell.ViewModel(accountType: .Investment, accountName: "Tax-Free Saver", balance: 204)
        accounts.append(savings)
        accounts.append(visa)
        accounts.append(investment)
    }
}


struct PreviewViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            AccountSummaryViewController()
        }
    }
}

struct ViewControllerPreview: UIViewControllerRepresentable{
    typealias UIViewControllerType = UIViewController
    
    let viewControllerBuilder: () -> UIViewController

    init(_ viewControllerBuilder: @escaping () -> UIViewController) {
        self.viewControllerBuilder = viewControllerBuilder
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
            return viewControllerBuilder()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        //
    }
}
