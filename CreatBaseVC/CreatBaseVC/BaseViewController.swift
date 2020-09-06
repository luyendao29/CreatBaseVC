//
//  BaseViewController.swift
//  CreatBaseVC
//
//  Created by Boss on 9/5/20.
//  Copyright © 2020 LuyệnĐào. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    let alertService = AlertService()
    func showAlertWithConfirm(type: AlertType, message: String, cancel: @escaping() -> Void, ok: @escaping() -> Void) {
        let vc = alertService.showAlertWithConfirm(type: type, message: message, cancel: cancel, ok: ok)
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: false, completion: nil)
    }
//    func showAlertConfirm(type: AlertType, message: String, cancel: @escaping() -> Void, ok: @escaping() -> Void) {
//        let alertVC = alertService.showAlertConfirm(type: type, message: message, cancel: cancel, ok: ok)
//        alertVC.modalPresentationStyle = .overFullScreen
//        present(alertVC, animated: false, completion: nil)
//    }
    
}
