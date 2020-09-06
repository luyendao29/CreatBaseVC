//
//  AlertConfirmVC.swift
//  CreatBaseVC
//
//  Created by Boss on 9/5/20.
//  Copyright © 2020 LuyệnĐào. All rights reserved.
//

import UIKit

class AlertConfirmVC: UIViewController {
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var okButton: UIButton!
    
    
    var canncelAction: (() ->Void)?
    var okAction: (() -> Void)?
    var message: String = ""
    var alertType = AlertType.ThongBao
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDisPlay()
        setMessage()
    }
    
    func setDisPlay() {
        switch alertType {
        case .ThongBao:
            titleLabel.text = "Thông Báo"
            titleLabel.backgroundColor = #colorLiteral(red: 0.5905393836, green: 1, blue: 1, alpha: 1)
            cancelButton.backgroundColor = #colorLiteral(red: 0.5905393836, green: 1, blue: 1, alpha: 1)
            okButton.backgroundColor = #colorLiteral(red: 0.5905393836, green: 1, blue: 1, alpha: 1)
            titleLabel.textColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            cancelButton.setTitleColor(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), for: .normal)
            okButton.setTitleColor(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), for: .normal)
        default:
            break
        }
    }
    
    func setMessage() {
        messageLabel.text =  message
    }
    
    @IBAction func TapCancel(_ sender: Any) {
        dismiss(animated: false, completion: canncelAction)
    }
    
    @IBAction func TapOK(_ sender: Any) {
        dismiss(animated: false, completion: okAction)
    }
    
}
