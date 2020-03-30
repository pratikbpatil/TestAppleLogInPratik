//
//  HomeViewController.swift
//  TestAppleLogInPratik
//
//  Created by Apple on 30/03/20.
//  Copyright © 2020 Pratik Patil. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var detailsOfUser = ""
    @IBOutlet var lblDetails: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.lblDetails.text = detailsOfUser
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
