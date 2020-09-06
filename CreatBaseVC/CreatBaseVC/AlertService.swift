//
//  AlertService.swift
//  CreatBaseVC
//
//  Created by Boss on 9/5/20.
//  Copyright © 2020 LuyệnĐào. All rights reserved.
//

import UIKit

enum AlertType {
    case ThongBao
    case XungDot
    case Loi
}
class AlertService {
    let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
    func showAlertWithConfirm(type: AlertType, message: String, cancel: @escaping() -> Void, ok: @escaping() -> Void) -> AlertConfirmVC {
        let vc = storyboard.instantiateViewController(identifier: "AlertConfirmVC") as! AlertConfirmVC
        vc.alertType = type
        vc.message = message
        vc.canncelAction = cancel
        vc.okAction = ok
//        vc.modalPresentationStyle = .overFullScreen
//        vc.modalTransitionStyle = .crossDissolve
        return vc
    }
}
