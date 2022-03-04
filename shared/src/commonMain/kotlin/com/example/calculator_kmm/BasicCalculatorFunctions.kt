package com.example.calculator_kmm

class BasicCalculatorFunctions {

    fun Addition(a: String, b: String): String {
        var numberOne:Int = 0
        var numberTwo:Int = 0
        try{
             numberOne = a.toInt()
        } catch (nfe: NumberFormatException){
            return "Give Valid Number"
        }
        try{
             numberTwo = b.toInt()
        } catch (nfe: NumberFormatException){
            return "Give Valid Number"
        }
        print(numberOne)
        return (numberOne + numberTwo).toString()
    }


}