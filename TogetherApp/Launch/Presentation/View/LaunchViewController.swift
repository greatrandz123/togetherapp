//
//  ViewController.swift
//  TogetherApp
//
//  Created by Randolf Dini-ay on 10/8/21.
//

import UIKit

final class LaunchViewController: UIViewController {
    
    private let viewModel: LaunchViewModel
    
    init(viewModel: LaunchViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: LaunchViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.launch()
        // Do any additional setup after loading the view.
    }
    

}
