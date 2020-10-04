//
//  ViewController.swift
//  PrimeraApp
//  Created by José Eduardo Rodríguez Reyes on 29/09/20.
//  Copyright © 2020 José Eduardo Rodríguez Reyes. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    //   Variables
    private let myPickerArray = ["Uno","Dos","Tres","Cuatro","Cinco"]

//    ESTOS SON LOS OUTLES
        
    @IBOutlet weak var myFirstPickerView: UIPickerView!
    @IBOutlet weak var myButtonBrais: UIButton!
    
    
// SE PREPARAN LAS CARACTERISTICAS DEL ELEMENTO
    override func viewDidLoad() {
        // BOTON
        super.viewDidLoad()
        myButtonBrais.setTitle("Brais", for: .normal)
        myButtonBrais.backgroundColor = .white
        myButtonBrais.setTitleColor(.white, for: .selected)
        
        // PICKERS
        myFirstPickerView.backgroundColor = .lightGray
//  datasource hace que una clase se encarga de cargar los elementos y que clase, pues ViewController
//  si se hace un cambio se quiere que se notifique en ViewController por eso ponermos self
//vamos a delegar con estos sobre el viewcontroller
        myFirstPickerView.dataSource = self
        myFirstPickerView.delegate = self
        
        
    }
    //ACCIONES DEL BOTON
    @IBAction func buttonAction(_ sender: Any) {
        if myButtonBrais.backgroundColor == .black{
            myButtonBrais.backgroundColor = .brown
            
        }else{
            myButtonBrais.backgroundColor = .blue
        }
    }
    
}

//EXTENDEMOS EL VIEW CONTROLLER PARA NO METER TANTO CODIGO EN SUS LLAVES

//datasource sirve para cargar datos en esa vista y delegate para interactuar con ellas

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1//esas filas tendra el componente
    }
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerArray.count
    }
//  Que representacion visual tendra c/u de los elementos
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        row es la posicion de los elementos
        return myPickerArray[row]
    }
    /*
     Esta funcion recibe mas cosas debo estar atento, ya que si tuviesemos mas elementos tendriamos que tener otro array
     */
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let myString = myPickerArray[row]
        
        myButtonBrais.setTitle(myString, for: .normal)
    }
}
    
    
    

