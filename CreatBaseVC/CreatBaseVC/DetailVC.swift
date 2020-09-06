//
//  DetailVC.swift
//  CreatBaseVC
//
//  Created by Boss on 9/5/20.
//  Copyright © 2020 LuyệnĐào. All rights reserved.
//

import UIKit

class DetailVC: BaseViewController, UITextFieldDelegate {
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        showAlertWithConfirm(type: .ThongBao, message: "Có muốn quay về không", cancel: {
            
        }, ok: {
            self.dismiss(animated: true, completion: nil)
        })
        return true
    }

}
