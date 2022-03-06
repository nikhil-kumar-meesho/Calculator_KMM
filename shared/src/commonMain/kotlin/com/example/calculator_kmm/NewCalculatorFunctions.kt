package com.example.calculator_kmm

class NewCalculatorFunctions {
    var firstNumber = 0
    var secondNumber = 0
    var tag = 1
    var currentOperation: Operation? = null

    enum class Operation {
        add,subtract,multiply,divide
    }

    fun clearResult(): String{
        currentOperation = null
        firstNumber = 0
        secondNumber = 0
        return "0"
    }

    fun zeroTapped(): String{
        if(currentOperation != null){
            if(secondNumber != 0){
                secondNumber *= 10
            }
            return secondNumber.toString()
        }

        if(firstNumber != 0){
            firstNumber *= 10
        }
        return firstNumber.toString()
    }

    fun numberPressed(tag: String): String{
        var tag = tag.toInt() -1
        if(currentOperation != null){
            secondNumber*= 10
            secondNumber+=tag
            return secondNumber.toString()
        }
        firstNumber*= 10
        firstNumber+=tag
        return firstNumber.toString()
    }



    fun operationPressed(tag: String):String {
        var tag = tag.toInt()


        if(tag == 1){
            var operation = currentOperation
            var ans:String = "0"
            when(operation) {
                Operation.add -> ans =  (firstNumber + secondNumber).toString()
                Operation.subtract -> ans = (firstNumber - secondNumber).toString()
                Operation.multiply -> ans = (firstNumber * secondNumber).toString()
                Operation.divide -> ans =  (firstNumber/secondNumber).toString()
            }
            currentOperation = null
            firstNumber = 0
            secondNumber = 0
            return ans

        }else if(tag == 2){
            currentOperation = Operation.add
        }else if(tag == 3){
            currentOperation = Operation.subtract
        }else if(tag == 4){
            currentOperation = Operation.multiply
        }else if(tag == 5){
            currentOperation = Operation.divide
        }

        return "0"
    }


}