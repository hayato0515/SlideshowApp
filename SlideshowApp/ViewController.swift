//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 宮瀬駿斗 on 2021/08/20.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var startstopbutton: UIButton!
    @IBOutlet weak var startbutton: UIButton!
    @IBOutlet weak var backbutton: UIButton!
    

    let imageView = UIImageView()
    
    
    
    var timer: Timer!
    
    var timer_sec: Float = 0
    
    var number = 0
    
    
    let image = [UIImage(named: "1") , UIImage(named: "2") ,UIImage(named: "3") ,UIImage(named: "4") ,UIImage(named: "5")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ImageView.image = image[number]
    }
    
    //NextViewControllerの戻るボタン
    @IBAction func unwind(_segue: UIStoryboardSegue){
        
    }
    

    @IBAction func tapAction(_ sender: Any) {
        //まずは、同じstororyboard内であることをここで定義します
        let storyboard: UIStoryboard = self.storyboard!
        
        //ここで移動先のstoryboardを選択(今回の場合は先ほどsecondと名付けたのでそれを書きます)
        let second = storyboard.instantiateViewController(withIdentifier: "second") as! NextViewController
        second.NextImage = ImageView.image
        
        //ここが実際に移動するコードとなります
        self.present(second, animated: true, completion: nil)
    }
    
    
   
    
    @IBAction func Next(_ sender: Any) {
        
        number += 1
        if number >= image.count {
            number = 0
        }
        
        ImageView.image = image[number]
    }
    
    
    @IBAction func Back(_ sender: Any) {
        
        number -= 1
        if number < 0 {
            number = image.count - 1
        }
       
        ImageView.image = image[number]
    }
    
    @objc func updateTimer(_ timer: Timer) {
           self.timer_sec += 2.0
        number += 1
        if number >= image.count {
            number = 0
        }
        ImageView.image = image[number]
        
       }
    
    
    @IBAction func startstop(_ sender: Any) {
        
       
        if self.timer == nil{
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target:self , selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            startstopbutton.setTitle("停止", for: .normal)
            backbutton.isEnabled = false
            startbutton.isEnabled = false

        
        }else{
            self.timer.invalidate()
            self.timer = nil
            startstopbutton.setTitle("再生", for: .normal)
            backbutton.isEnabled = true
            startbutton.isEnabled = true
        }
        
    }
    
    
    

}

