import Foundation

class UserStore{
    
    private struct Constants{
        static let emailKey = "emailKey"
    }
    
    func setUserEmail(email:String){
        UserDefaults.standard.set(email, forKey: Constants.emailKey)
    }
    
    func getUserEmail()->String?{
        return UserDefaults.standard.object(forKey: Constants.emailKey) as? String
    }
    
    func isUserSignedIn()->Bool{
        return getUserEmail() != nil
    }
    
}
