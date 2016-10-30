//
//  RefreshControl.swift
//  SwiftPullToRefresh
//
//  Created by trungnd on 10/4/16.
//  Copyright © 2016 redvn. All rights reserved.
//

import UIKit

class RefreshControl: UIRefreshControl {

    var beginRefreshingCallback: (()->())? {
        didSet {
            addTarget(self, action: #selector(UIRefreshControl.beginRefreshing), for: .valueChanged)
        }
    }

    override func beginRefreshing() {
        super.beginRefreshing()
        if let callback = beginRefreshingCallback {
            callback()
        }
    }
}
