
//  main.swift
//  TravelReservation
//
//  Created by afaf almajhad on 29/05/1443 AH.
//

import Foundation
//--------------------Passenger------------------------------------
public class Passenger {
    var passengerName = ""
    var passengerId = ""
    var passengerGender = ""
    var passengerAge = ""
    var passengerInfo = ""
    
     func getPassengerInfo(){
        print("Enter Your complete Name")
        passengerName = readLine()!
        print("Enter Your National Id or Iqamah")
        passengerId = readLine()!
        print("Enter your Gender Male or Female")
        passengerGender = readLine()!
        print("Enter Your Age")
        passengerAge = readLine()!

    }
     func printPassengerInfo(){
        print("*Passenger Name:\(self.passengerName)")
        print("*Passenger Id:\(self.passengerId)")
        print("*Passenger Age:\(self.passengerAge)")
        print("*Passenger Gender:\(self.passengerGender)")
    }
}

//-------------------------Flight-------------------------------

public class Flight {
    
    var flightDate:String = ""
    
    let riyadhFlights:[String:String] = ["Jeddah": "5:40", " Damamm":"21:33" ,"Hail":"12:50"]
    
    let jeddahFlights :[String:String] = ["Riyadh":"5:55", "Damamm":"6:66","Hail":"2:34"]
    
    let dammamFlights :[String:String] = ["Riyadh":"4:00", "Jeddah  ":"4:32","Hail":"6:53"]
    
    let hailFlights :[String:String] = ["Riyadh":"9:09","Jeddah":"7:54", "Damamm":"5:43"]
    
    
    var depaturecity = ""
    var arrivalCity = ""
    
     func getFlightInfo(){
         print( "Select Depature City 'Riyadh' or 'Jeddah' or 'Dammam' or 'Hail'")
         depaturecity = readLine()!
         print("Select Arrival City 'Riyadh' or 'Jeddah' or 'Dammam' or 'Hail'")
         arrivalCity = readLine()!
         print("Enter Flight Date ''dd/mm/yyyy'' ")
          flightDate = readLine()!
    
    }
    
    var flightDepatureTime = ""
    
      func printFlightInfo(){
          print ("*Flight from \(self.depaturecity) to \(self.arrivalCity)")
          print("*Flight Date:\(self.flightDate)")
          
          if depaturecity == "Riyadh"{
              flightDepatureTime = riyadhFlights[self.arrivalCity]!
              print("*Depature Time \(self.flightDepatureTime)")}
              
          else if depaturecity == "Jeddah"{
              flightDepatureTime = jeddahFlights[self.arrivalCity]!
            print("*Depature Time \(self.flightDepatureTime)")
          }
              else if depaturecity == "Dammam"{
                  flightDepatureTime = dammamFlights[self.arrivalCity]!
                print("*Depature Time \(self.flightDepatureTime)")
              }
              else if depaturecity == "Hail"{
                flightDepatureTime = hailFlights[self.arrivalCity]!
                print("*Depature Time \(self.flightDepatureTime)")
              }
              else
              {print("Wrong Choice")}
    }
}


 //---------------------------Services-------------------------------------

struct Service{
    let serviceName:ServiceName
    let price:Int
    
    /*func printInfo(){
        print("Service Name:",serviceName,"with price",price)
    }*/

}

enum ServiceName {
    case Book_Flight
    case Add_Extra_Bag
    case Upgrade_Your_Class
}

let service1:Service = Service(serviceName: .Book_Flight, price: 400)
let service2:Service = Service(serviceName: .Add_Extra_Bag, price: 150)
let service3:Service = Service(serviceName: .Upgrade_Your_Class, price: 500)


let servicesWithPrice :[Service] = [service1,service2,service3]
var userOrder :[Service] = []

let services =
"""
1.Book flight
2.Add Extra Bag
3.Upgarde Your Class
"""

var userInput = ""
let passenger = Passenger()
let flight = Flight()


  repeat{
    
print("--------------------------------------------")
print("----Welcome To Safe Trip Travel Agency------")
print("------------------Menue---------------------")
print("1.See All the Services")
print("2.Select Service")
print("3.Display the Total Price")
print("4.Get your Booking Information")
print("5.Exit")
print("--------------------------------------------")
print("Select Your Choice")
print("--------------------------------------------")


if let userChoice = readLine(){
    userInput = userChoice
    
    switch userInput{
        
    case "1" :
    print(services)
        
        
    case "2" :
        readUserOrder()
        passenger.getPassengerInfo()
        flight.getFlightInfo()
        
    case "3":
        let totalPrice = calculatePrice(array:userOrder)
        print("Total Price \(totalPrice)")
        
    case "4":
        passenger.printPassengerInfo()
        flight.printFlightInfo()
     
        
    case "5":
        print("See You Soon")
        
    default:
        print("default")
        
    }
}
}while userInput != "5"



func readUserOrder(){
    var userService = ""
    
    repeat{
        print("Please Enter Service Number: ")
        userService = readLine()!
        
        switch userService{
        case "1" :
            userOrder.append(servicesWithPrice[0])
            print(userOrder)
            
        case "2":
            userOrder.append(servicesWithPrice[1])
            print(userOrder)
            
        case "3":
            userOrder.append(servicesWithPrice[2])
            print(userOrder)
            
            
        default:
            print("default")
        }
        print("Do You want another service (Y or N)")
        userService = readLine()!
   
    }while userService != "N"
                
    
}


func calculatePrice (array:[Service])->Int{
    var totalPrice = 0
    for i in array {
        totalPrice = totalPrice + i.price
}
    return totalPrice
}


    /*for service in array{
        service.printInfo()
    }
    return totalPrice
*/




