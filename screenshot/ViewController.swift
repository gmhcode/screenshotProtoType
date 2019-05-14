//
//  ViewController.swift
//  screenshot
//
//  Created by Greg Hughes on 5/14/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        buttonTapped()
        screenShot()
    }
    
    
    func buttonTapped(){
        button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), for: .highlighted)
        button.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
    }
    
    func screenShot(){
        guard let layer = UIApplication.shared.keyWindow?.layer else {print("🔥❇️>>>\(#file) \(#line): guard ket failed<<<"); return  }
        
        let renderer = UIGraphicsImageRenderer(size: layer.frame.size)
        let image = renderer.image(actions: { context in
            layer.render(in: context.cgContext)
        })
        
        //Save it to the camera roll
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
}

