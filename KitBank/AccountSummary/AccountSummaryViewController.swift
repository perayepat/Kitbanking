import UIKit
import SwiftUI

class AccountSummaryViewController: UIViewController{

    
    
    let games = [
        "Pacman",
        "Space Invaders",
        "Space Patrol"
    ]
    
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
    }
    
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self // We are going to supply the data for this table view
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
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
        games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = games[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
