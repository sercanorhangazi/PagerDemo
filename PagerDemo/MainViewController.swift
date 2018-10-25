//
//  MainViewController.swift
//  PagerDemo
//
//  Created by Sercan Orhangazi on 24.10.2018.
//  Copyright © 2018 Sercan Orhangazi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row != 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "regularCell") as? RegularTableViewCell else { return UITableViewCell() }
            cell.label.text = String(describing: indexPath.row)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "commentsCell") as? CommentsTableViewCell else { return UITableViewCell() }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 3 {
            return 200
        }
        return UITableView.automaticDimension
    }
}
