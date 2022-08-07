//
//  InitialVC.swift
//  Mock_DepIncjection
//
//  Created by AnatoliiOstapenko on 06.08.2022.
//

import UIKit

class InitialVC: UIViewController {
    
    let initialTableView = UITableView()
    var users: [Users] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        updateUsers()
    }
    
    private func configure() {
        view.setInitialTableView(view: view, tableView: initialTableView, vc: self)
    }
    
    func updateUsers() {
        guard let url = Constants.url else { return }
        
        NetworkManagerSecond.init(session: URLSession.shared).getData(url: url) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let users):
                self.updateTableView(users: users)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
//        NetworkManager.shared.getUsers(url: url) { [weak self] result in
//            guard let self = self else { return }
//            switch result {
//            case .success(let users): self.updateTableView(users: users)
//            case .failure(let error): print(error)
//            }
//        }
    }
    
    private func updateTableView(users: [Users]) {
        if !users.isEmpty {
            self.users = users
            DispatchQueue.main.async {
                self.initialTableView.reloadData()
            }
        }
    }
}

extension InitialVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InitialCell.reuseID, for: indexPath) as! InitialCell
        cell.updateInitialCell(user: users[indexPath.row])
        return cell
    }
}

extension InitialVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
