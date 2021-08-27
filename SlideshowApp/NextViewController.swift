//
//  NextViewController.swift
//  SlideshowApp
//
//  Created by 宮瀬駿斗 on 2021/08/20.
//

import UIKit

class NextViewController: UIViewController {

    var NextImage : UIImage!
    
    @IBOutlet weak var NextImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NextImageView.image = NextImage
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
