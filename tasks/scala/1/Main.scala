package recfun
import common._

object Main {
  def main(args: Array[String]) {
    println("Exercise 1 Pascal's Triangle:")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }
    
    
    println("\nExercise 2 Parentheses Balancing:")
    val str = "((rw)(w)e)w(e)"
    if (balance(str.toList))
      println(str + " is balance")
    else
      println(str + " is not balance")
    println()
    
    println("\nExercise 3 Counting Change:")
    val coins = List(1,2,3,4,5,6)
    println("Count change: " + countChange(9, coins))
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if ((c == 0) | (c == r)) 1
    else pascal(c - 1, r - 1) + pascal(c, r - 1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    def count(chars: List[Char], num: Int): Boolean = chars match { 
      case '(' :: tail => count(tail, num+1)
      case ')' :: tail => if (num > 0) count(tail, num-1) else false
      case _ :: tail => count(tail, num)
      case Nil => num == 0
    }
    count(chars, 0)
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = coins match {
    case coin :: tail if (coin == money)  
      => 1 + countChange(money, coins.tail)
    case coin :: tail if (coin < money) 
      => countChange(money-coin,tail) + countChange(money, coins.tail)
    case _ :: tail 
      => countChange(money, coins.tail)
    case Nil => 
      0
  }
}
