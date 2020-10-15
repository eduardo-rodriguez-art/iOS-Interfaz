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
    @IBOutlet weak var myButtonBrais: UIButton!
    @IBOutlet weak var myFirstPickerView: UIPickerView!
    
    @IBOutlet weak var myPageControl: UIPageControl!
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var mySlider: UISlider!
    
    @IBOutlet weak var myStepper: UIStepper!
    
    @IBOutlet weak var mySwitch: UISwitch!
    
// SE PREPARAN LAS CARACTERISTICAS DEL ELEMENTO
    override func viewDidLoad() {
        // BOTON
        super.viewDidLoad()
        
        //       OULETS CARACTERISTICAS
        
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
        myFirstPickerView.isHidden = true
//      El interruptor esta apagado por lo tanto el picker debe estar oculto
        
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
        //SLIDERS
        mySlider.minimumTrackTintColor = .red
        mySlider.minimumValue = 1
        mySlider.maximumValue = Float(myPickerArray.count)
        mySlider.value = 1
        
        //STEPPERS
        myStepper.minimumValue = 1
        myStepper.maximumValue = Double(myPickerArray.count)
        
        // Switch
        mySwitch.onTintColor = .blue
        mySwitch.isOn = false //Indica si esta apagado
        
        
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
        
        mySlider.value = Float(myPageControl.currentPage + 1)
        
        myStepper.value = Double(myPageControl.currentPage + 1)
        
    }
    //ACCIONES DEL SEGMENTED CONTROL
    
    @IBAction func mySegmentedControlAction(_ sender: Any) {
        myFirstPickerView.selectRow(mySegmentedControl.selectedSegmentIndex, inComponent: 0, animated: true)
        
        let myString = myPickerArray[mySegmentedControl.selectedSegmentIndex]
        
        myButtonBrais.setTitle(myString, for: .normal)
        
        myPageControl.currentPage = mySegmentedControl.selectedSegmentIndex
        
        mySlider.value = Float(mySegmentedControl.selectedSegmentIndex+1)
        
        myStepper.value = Double(mySegmentedControl.selectedSegmentIndex + 1)
        
    }
    
    //  ACCIONES DEL  SLIDER
    
    @IBAction func mySliderAction(_ sender: Any) {
        
        switch mySlider.value {
            
        case 1..<2:
            mySegmentedControl.selectedSegmentIndex = 0
            myPageControl.currentPage = mySegmentedControl.selectedSegmentIndex
            let myString = myPickerArray[0]
            myButtonBrais.setTitle(myString, for: .normal)
            myPageControl.currentPage = 0
        case 2..<3:
            mySegmentedControl.selectedSegmentIndex = 1
            myPageControl.currentPage = mySegmentedControl.selectedSegmentIndex
            let myString = myPickerArray[1]
            myButtonBrais.setTitle(myString, for: .normal)
            
            myPageControl.currentPage = 1
        case 3..<4:
            mySegmentedControl.selectedSegmentIndex = 2
            myPageControl.currentPage = mySegmentedControl.selectedSegmentIndex
            let myString = myPickerArray[2]
            myButtonBrais.setTitle(myString, for: .normal)
            myPageControl.currentPage = 2
        case 4..<5:
            mySegmentedControl.selectedSegmentIndex = 3
            myPageControl.currentPage = mySegmentedControl.selectedSegmentIndex
            let myString = myPickerArray[3]
            myButtonBrais.setTitle(myString, for: .normal)
            myPageControl.currentPage = 3
        default:
            mySegmentedControl.selectedSegmentIndex = 4
            myPageControl.currentPage = mySegmentedControl.selectedSegmentIndex
            let myString = myPickerArray[4]
            myButtonBrais.setTitle(myString, for: .normal)
            myPageControl.currentPage = 4

        }
    }
    
//    ACCIONES DEL STEPPER
//    con el stepper no puedo aun modificar el picker
    
    @IBAction func myStepperAction(_ sender: Any) {
        
        let miValor = myStepper.value
        mySlider.value = Float(miValor)
        mySegmentedControl.selectedSegmentIndex = Int(miValor)-1
        myPageControl.currentPage = Int(miValor) - 1
        
        
//        myButtonBrais.setTitle(myString, for: .normal)
    }
    
    //ACCIONES DEL SWITCH
    
    @IBAction func mySwitchAction(_ sender: Any) {
//        SI ESTA ENCENDIDO
        if mySwitch.isOn{
            myFirstPickerView.isHidden = false //hidden si esta apagado
        }else{
            myFirstPickerView.isHidden = true
        }
    }
    
}
//EXTIENDE EL VIEW CONTROLLER PARA NO TENER TANTO CODIGO EN SUS LLAVES

//datasource sirve para cargar datos en esa vista y delegate para interactuar con ellas

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //ESTE CONTROLA EL PICKER
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
        
        mySlider.value = Float(row+1)
//      que el stepper se bloque al llegar al minimo o maximo
        myStepper.value = Double(row+1)
    }
}
    
    
    

