//
//  ViewController.swift
//  view-capture-demo
//
//  Created by OkuderaYuki on 2017/06/08.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - view life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - actions
    
    @IBAction func didTapSaveButton(_ sender: Any) {
        
        guard let image = Capture.take(view: self.view) else {
            print("shooting failure.")
            return
        }
        Capture.save(image: image)
    }
}

