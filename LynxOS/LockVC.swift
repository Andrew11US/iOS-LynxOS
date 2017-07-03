//
//  ViewController.swift
//  LynxOS
//
//  Created by Andrew Foster on 6/25/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import UIKit
import LocalAuthentication

class LockVC: UIViewController {

    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLbl.text = getTime()
        dateLbl.text = getDate()
        
        _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
            self.timeLbl.text = Date().getTime()
            self.dateLbl.text = Date().getDate()
        }
        unlockTapped((Any).self)
    }
    
    @IBAction func unlockTapped(_ sender: Any) {
        
        // 1. Create a authentication context
        let authenticationContext = LAContext()
        var error:NSError?
        
        // 2. Check if the device has a fingerprint sensor
        // If not, show the user an alert view and bail out!
        guard authenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            
            showAlertViewIfNoBiometricSensorHasBeenDetected()
            return
            
        }
        
        // 3. Check the fingerprint
        authenticationContext.evaluatePolicy(
            .deviceOwnerAuthenticationWithBiometrics,
            localizedReason: "Security Check",
            reply: { [unowned self] (success, error) -> Void in
                
                if( success ) {
                    
                    // Fingerprint recognized
                    // Go to view controller
                    self.navigateToAuthenticatedViewController()
                    
                } else {
                    
                    // Check if there is an error
                    if let error = error {
                        
                        let message = self.errorMessageForLAErrorCode(error._code)
                        self.showAlertViewAfterEvaluatingPolicyWithMessage(message)
                        
                    }
                }
        })
    }
    
    /**
     This method will present an UIAlertViewController to inform the user that the device has not a TouchID sensor.
     */
    func showAlertViewIfNoBiometricSensorHasBeenDetected(){
        
        showAlertWithTitle("Error", message: "TouchID is not available")
        
    }
    
    func showAlertViewAfterEvaluatingPolicyWithMessage( _ message:String ){
        
        showAlertWithTitle("Error", message: message)
        
    }
    
    func showAlertWithTitle( _ title:String, message:String ) {
        
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertVC.addAction(okAction)
        
        DispatchQueue.main.async { () -> Void in
            
            self.present(alertVC, animated: true, completion: nil)
            
        }
        
    }
    
    func errorMessageForLAErrorCode( _ errorCode:Int ) -> String {
        
        var message = ""
        
        switch errorCode {
            
        case LAError.Code.appCancel.rawValue:
            message = "Authentication was cancelled by application"
            
        case LAError.Code.authenticationFailed.rawValue:
            message = "The user failed to provide valid credentials"
            
        case LAError.Code.invalidContext.rawValue:
            message = "The context is invalid"
            
        case LAError.Code.passcodeNotSet.rawValue:
            message = "Passcode is not set on the device"
            
        case LAError.Code.systemCancel.rawValue:
            message = "Authentication was cancelled by the system"
            
        case LAError.Code.touchIDLockout.rawValue:
            message = "Too many failed attempts."
            
        case LAError.Code.touchIDNotAvailable.rawValue:
            message = "TouchID is not available on the device"
            
        case LAError.Code.userCancel.rawValue:
            message = "The user did cancel"
            
        case LAError.Code.userFallback.rawValue:
            message = "The user chose to use the fallback"
            
        default:
            message = "Did not find error code on LAError object"
            
        }
        
        return message
    }
    
    func navigateToAuthenticatedViewController(){
        
        DispatchQueue.main.async { () -> Void in
            
            self.performSegue(withIdentifier: Identifiers.main.rawValue, sender: nil)
        }
    }
    
    func getTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        let currentTime = dateFormatter.string(from: Date())
        
        return currentTime
    }
    
    func getDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        
        return currentDate
    }

}

