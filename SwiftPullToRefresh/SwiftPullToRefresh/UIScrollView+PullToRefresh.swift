//
//  UIScrollView+PullToRefresh.swift
//  SwiftPullToRefresh
//
//  Created by trungnd on 10/4/16.
//  Copyright © 2016 redvn. All rights reserved.
//

import UIKit

extension UIScrollView {
    
    var refreshViewHeight: Double {
        return 20
    }
    
    var refreshViewWidth: Double {
        return Double(UIScreen.main.bounds.width)
    }
    
    open func addPullToRefreshWithCallback(_ callback: @escaping ()->()) {
        let refreshControl = RefreshControl(frame: CGRect(x: 0, y: 0, width: refreshViewWidth, height: refreshViewHeight))
        refreshControl.beginRefreshingCallback = callback
        addSubview(refreshControl)
    }
    
    open func beginRefreshing() {
        for view in subviews {
            if let view = view as? RefreshControl {
                if view.isRefreshing { return }
                setContentOffset(CGPoint(x: 0, y: -view.frame.height), animated: true)
                view.beginRefreshing()
            }
        }
    }
    
    open func endRefreshing() {
        for view in subviews {
            if let view = view as? RefreshControl {
                view.endRefreshing()
            }
        }
    }
    
    open func isRefreshing() -> Bool {
        for view in subviews {
            if let view = view as? RefreshControl {
                return view.isRefreshing
            }
        }
        return false
    }
}
