//
//  ViewController.swift
//  SwiftPullToRefreshExample
//
//  Created by trungnd on 10/4/16.
//  Copyright © 2016 redvn. All rights reserved.
//

import UIKit
import SwiftPullToRefresh

class ViewController: UIViewController {
    
    var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.frame = view.bounds
        view.addSubview(tableView)
        
        tableView.addPullToRefreshWithCallback { [weak self] in
            DispatchQueue.global().async {
                sleep(3)
                DispatchQueue.main.async {
                    self?.tableView.endRefreshing()
                }
            }
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.beginRefreshing()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

