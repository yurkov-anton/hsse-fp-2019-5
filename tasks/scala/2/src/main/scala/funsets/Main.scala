package funsets

object Main extends App {
  import FunSets._
  //var s1: Set = union(singletonSet(1), union(singletonSet(2), singletonSet(4)))
  //var s2: Set = union(singletonSet(4), singletonSet(5))
  
  //printSet(s1)
  //printSet(s2)
  //printSet(intersect(s1,s2))
  //printSet(diff(s1,s2))
  println(contains(singletonSet(1), 1))
}
