import UIKit


class DummyViewController: UIViewController {
    
    weak var logoutDelegate: LogoutDelegate?
    let stackView = UIStackView()
    let label = UILabel()
    @objc let logoutButton = UIButton(type: .system)
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension DummyViewController{
    func style(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.configuration = .filled()
        logoutButton.setTitle("Logout", for: [])
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .primaryActionTriggered)
    }
    
    func layout(){
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(logoutButton)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    @objc func logoutButtonTapped(sender: UIButton){
        logoutDelegate?.didLogout()
    }
}

