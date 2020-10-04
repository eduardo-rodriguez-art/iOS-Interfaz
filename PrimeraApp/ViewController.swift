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
    @IBOutlet weak var myPageControl: UIPageControl!
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    
// SE PREPARAN LAS CARACTERISTICAS DEL ELEMENTO
    override func viewDidLoad() {
        // BOTON
        super.viewDidLoad()
        
        myButtonBrais.setTitle("", for: .normal)
        myButtonBrais.backgroundColor = .black
        myButtonBrais.setTitleColor(.white, for: .selected)
        
        // PICKERS
        myFirstPickerView.backgroundColor = .lightGray
//  datasource hace que una clase se encarga de cargar los elementos y que clase, pues ViewController
//  si se hace un cambio se quiere que se notifique en ViewController por eso ponermos self
//vamos a delegar con estos sobre el viewcontroller
        myFirstPickerView.dataSource = self
        myFirstPickerView.delegate = self
        
        //PAGE CONTROL
        myPageControl.numberOfPages = myPickerArray.count
        myPageControl.backgroundColor = .cyan
//        para pintar el seleccionado
        myPageControl.currentPageIndicatorTintColor = .blue
        myPageControl.pageIndicatorTintColor = .lightGray
        
        //SEGMENTED CONTROL
        mySegmentedControl.removeAllSegments()
        
        for (index,value) in myPickerArray.enumerated(){
        
            mySegmentedControl.insertSegment(withTitle: value, at: index, animated: true)
            
        }
        
    }
        //ACTIONS
    //ACCIONES DEL BOTON
    @IBAction func buttonAction(_ sender: Any) {
        if myButtonBrais.backgroundColor != .gray{
            myButtonBrais.backgroundColor = .brown
            
        }else{
            myButtonBrais.backgroundColor = .black
        }
    }
//    ACCIONES DEL PAGE CONTROL
    
    @IBAction func myPageCAction(_ sender: Any) {
//       0 porque solo se tiene una columna en el picker
    myFirstPickerView.selectRow(myPageControl.currentPage, inComponent: 0, animated: true)
        let myString = myPickerArray[myPageControl.currentPage]
        
        myButtonBrais.setTitle(myString, for: .normal)
        
        mySegmentedControl.selectedSegmentIndex = myPageControl.currentPage
        
    }
    //ACCIONES DEL SEGMENTED CONTROL
    
    @IBAction func mySegmentedControlAction(_ sender: Any) {
        myFirstPickerView.selectRow(mySegmentedControl.selectedSegmentIndex, inComponent: 0, animated: true)
        
        let myString = myPickerArray[mySegmentedControl.selectedSegmentIndex]
        
        myButtonBrais.setTitle(myString, for: .normal)
        
        myPageControl.currentPage = mySegmentedControl.selectedSegmentIndex
        
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
        
        myPageControl.currentPage = row
        
        mySegmentedControl.selectedSegmentIndex = row
    }
}
    
    
    

