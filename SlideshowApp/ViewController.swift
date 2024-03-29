//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 内海雄斗 on 2019/10/17.
//  Copyright © 2019 内海雄斗. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slideshow: UIImageView!
    
    @IBOutlet weak var Back: UIButton!
    @IBOutlet weak var Next: UIButton!
    @IBOutlet weak var Expantion: UIButton!
    @IBOutlet weak var label: UILabel!
    
    /// 一定の間隔で処理を行うためのタイマー
    var timer: Timer?
    
    /// 表示している画像の番号
    var dispImageNo = 0
    
    
    /// 表示している画像の番号を元に画像を表示する
    func displayImage() {
        
        // 画像の名前の配列
        let imageNameArray = [
            "a",
            "i",
            "u",
            "e",
            "o",
        ]
        
        // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 4
        }
        
        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 4 {
            dispImageNo = 0
        }
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        slideshow.image = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "a")
        slideshow.image = image
    }
    
    /// NSTimerによって、一定の間隔で呼び出される関数
    @objc func onTimer(timer: Timer)  {
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    @IBAction func startstop(_ sender: Any) {
        if self.timer != nil {
            // タイマーを停止する
            self.timer?.invalidate()
            self.timer = nil
            
            label.text = "再生"
            
            Back.isEnabled = true
            Next.isEnabled = true
            Expantion.isEnabled = true
        } else {
            // タイマー始動
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(ViewController.onTimer(timer:)), userInfo: nil, repeats: true)
            
            label.text = "停止"
            
            Back.isEnabled = false
            Next.isEnabled = false
            Expantion.isEnabled = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    @IBAction func Back(_ sender: Any) {
        dispImageNo -= 1
        if dispImageNo < 0 {
            dispImageNo = 4
        }
        displayImage()
    }
    @IBAction func Next(_ sender: Any) {
        dispImageNo += 1
        if dispImageNo > 5 {
            dispImageNo = 0
        }
        displayImage()
    }

// segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
               let nextView = segue.destination as! ExViewController
               nextView.Number = dispImageNo
           }
    
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
       }
}
