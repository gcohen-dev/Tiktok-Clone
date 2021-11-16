//
//  NextViewController.swift
//  KD Tiktok-Clone
//
//  Created by Guy Cohen on 15/11/2021.
//  Copyright © 2021 Kaishan. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var imagePlaceHolder: UIImageView!
    var index = 1
    let images = [UIImage(named: "sblanket_1"), UIImage(named: "sblanket_2"), UIImage(named: "sblanket_3"), UIImage(named: "sblanket_4")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func swipeImages(_ sender: UIButton) {
        let current = index % 4
        let currentImage = images[current]!
        imagePlaceHolder.image = currentImage
        index += 1
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
