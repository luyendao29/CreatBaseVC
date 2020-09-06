//
//  ViewController.swift
//  CreatBaseVC
//
//  Created by Boss on 9/5/20.
//  Copyright © 2020 LuyệnĐào. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapToShowAlert(_ sender: Any) {
        
        showAlertWithConfirm(type: .ThongBao, message: "Bạn có muốn nhập text không?", cancel: {
            print("Cancel")
        }, ok: {
            print("OK")
            let vc = self.storyboard?.instantiateViewController(identifier: "DetailVC") as! DetailVC
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        })
    }
    
}

