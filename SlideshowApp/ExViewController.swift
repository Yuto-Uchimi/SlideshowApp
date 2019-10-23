
import UIKit

class ExViewController: UIViewController {
    
    @IBOutlet weak var Ex: UIImageView!
    
    var Number = 0
    
    /// 一定の間隔で処理を行うためのタイマー
    var timer: Timer?
    
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
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[Number]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        Ex.image = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
}
