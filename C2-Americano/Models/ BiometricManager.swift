//
//   BiometricManager.swift
//  C2-Americano
//
//  Created by Burak Demirhan on 12/11/25.
//

import Foundation
import LocalAuthentication

class BiometricManager{
    static let shared = BiometricManager()
    
    private init(){}
    
    
    func authenticateWithBiometrics() async -> Bool {
        let context = LAContext()
        var error: NSError?
        
        guard context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error ) else {
            print("Biometrics not available:", error?.localizedDescription ?? "")
                       return false
        }
        
        let reason = "Unlock your Netflix Profile"
        
        do{
            let success = try await context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason)
            return success

        }catch{
            print("Biometric auth failed:", error.localizedDescription)
                        return false
        }
        
    }
}
