//
//  ViewController.swift
//  Registro
//
//  Created by Carlos Hidalgo on 27/09/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtMail: UITextField!
    
    @IBOutlet weak var txtApellido: UITextField!
    @IBOutlet weak var txtTel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func ValidaNombres(string:String) -> Bool  {
            let numberOnly = NSCharacterSet.init(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz")
            let stringFromTextField = NSCharacterSet.init(charactersIn: string)
            return numberOnly.isSuperset(of: stringFromTextField as CharacterSet)
    }
    func ValidaTel(string:String) -> Bool  {
            let numberOnly = NSCharacterSet.init(charactersIn: "0123456789")
            let stringFromTextField = NSCharacterSet.init(charactersIn: string)
            return numberOnly.isSuperset(of: stringFromTextField as CharacterSet)
    }
    
    
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    @IBAction func btnAgregar(_ sender: Any) {
        if (txtNombre.text?.isEmpty)! && (txtApellido.text?.isEmpty)! && (txtTel.text?.isEmpty)! && (txtMail.text?.isEmpty)! {
            let missingInformationAlert = UIAlertController(title: "FALTAN INFORMACION ",
                                                           message: "VALIDAR CAMPOS VACIOS",
                                                  preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            missingInformationAlert.addAction(cancelAction)
             self.present(missingInformationAlert, animated: true, completion: nil)
        }
        
    }
    @IBAction func valiNombre(_ sender: UITextField) {
        if (sender.text?.isEmpty)!  {
           let missingInformationAlert = UIAlertController(title: "FALTO INFORMACION ",
                                                          message: "Nombre requerido",
                                                 preferredStyle: .alert)
           let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
           missingInformationAlert.addAction(cancelAction)
            self.present(missingInformationAlert, animated: true, completion: nil)
        }else if(ValidaNombres(string: sender.text!) == false )
        {
            let missingInformationAlert = UIAlertController(title: "Formato Invalido",
                                                            message: "Valida Nombre",
                                                            preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            missingInformationAlert.addAction(cancelAction)
            self.present(missingInformationAlert, animated: true, completion: nil)
            
        }
    }
    @IBAction func valiApellido(_ sender: UITextField) {
        if (sender.text?.isEmpty)!  {
             let missingInformationAlert = UIAlertController(title: "FALTO INFORMACION",
                                                            message: "Apellido requerido",
                                                   preferredStyle: .alert)
                    let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
             missingInformationAlert.addAction(cancelAction)

             self.present(missingInformationAlert, animated: true, completion: nil)
         }else if(ValidaNombres(string: sender.text!) == false )
        {
            let missingInformationAlert = UIAlertController(title: "Formato Invalido",
                                                            message: "Valida Apellido",
                                                            preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            missingInformationAlert.addAction(cancelAction)
            self.present(missingInformationAlert, animated: true, completion: nil)
            
        }
    }
    @IBAction func valiTel(_ sender: UITextField) {
        if (txtTel.text?.isEmpty)! {
            let missingInformationAlert = UIAlertController(title: "FALTO INFORMACION",
                                                            message: " Telefono requerido",
                                                            preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            missingInformationAlert.addAction(cancelAction)
            self.present(missingInformationAlert, animated: true, completion: nil)
        }else if(ValidaTel(string: sender.text!) == false )
        {
            let missingInformationAlert = UIAlertController(title: "Formato Invalido",
                                                            message: "Valida Telefono",
                                                            preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            missingInformationAlert.addAction(cancelAction)
            self.present(missingInformationAlert, animated: true, completion: nil)
            
        }
    }
    @IBAction func valiMail(_ sender: UITextField) {
        if (sender.text?.isEmpty)!  {
            let missingInformationAlert = UIAlertController(title: "FALTO INFORMACION",
                                                            message: " Correo requerido",
                                                            preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            missingInformationAlert.addAction(cancelAction)
            self.present(missingInformationAlert, animated: true, completion: nil)
        } else if (isValidEmail(email: sender.text!) == false){
            let missingInformationAlert = UIAlertController(title: "Formato Invalido",
                                                            message: "Valida Correo",
                                                            preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            missingInformationAlert.addAction(cancelAction)
            self.present(missingInformationAlert, animated: true, completion: nil)
            
            
        }
    }
    
}

