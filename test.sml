(* fun square n = n * n;
print ("The square of 4 is: " ^ (Int.toString (square 4))^ "\n"); *)

(*fun sign n =
  if n > 0 then "Positive"
  else if n < 0 then "Negative"
  else "Zero";*)

(*fun sign 0 = "Zero"
  | sign n = if n > 0 then "Positive" else "Negative";

sign 0;
sign 3;
sign ~3;*)

(* RECURSION *)
(* fun factorial 0 = 1
  | factorial n = n * (factorial (n - 1));*)

(* LISTS *)
val numbers = [1,2,3,4,5];
val letters = ["a","b","c","d","e"];
fun listLength [] = 0
  | listLength(_::xs) = 1 + listLength(xs);
