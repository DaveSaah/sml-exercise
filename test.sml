datatype Tree =
    Empty
  | Leaf of int
  | TwoNode of int * Tree * Tree
  | ThreeNode of int * int * Tree * Tree * Tree;
(*TRANSVERSAL FUNCTION*)

fun traverse Empty = []
  | traverse (Leaf key) = [key]
  | traverse (TwoNode (key, left, right)) =
      traverse left @ [key] @ traverse right
  | traverse (ThreeNode (key1, key2, left, middle, right)) =
      traverse left @ [key1] @ traverse middle @ [key2] @ traverse right;

(* DELETE FUNCTION *)

fun findMin (Leaf key) = key
  | findMin (TwoNode (_, left, _)) = findMin left
  | findMin Empty = 0
  | findMin (ThreeNode (_, _, left, _, _)) = findMin left;

fun delete key Empty = Empty
  | delete key (Leaf k) =
      if key = k then Empty
      else Leaf k
  | delete key (TwoNode (k, left, right)) =
      if key = k then
        (* Replace with the minimum key from the right subtree *)
        case right of
            Empty => left (* If right is empty, promote the left subtree *)
          | _ =>
            let val min = findMin right in
              TwoNode (min, left, delete min right)
            end
      else if key < k then TwoNode (k, delete key left, right)
      else TwoNode (k, left, delete key right)
  | delete key (ThreeNode (k1, k2, left, middle, right)) =
      if key = k1 then
        let val min = findMin middle in
          ThreeNode (min, k2, delete min left, middle, right)
        end
      else if key = k2 then
        let val min = findMin right in
          ThreeNode (k1, min, left, middle, delete min right)
        end
      else if key < k1 then ThreeNode (k1, k2, delete key left, middle, right)
      else if key < k2 then ThreeNode (k1, k2, left, delete key middle, right)
      else ThreeNode (k1, k2, left, middle, delete key right);

(*INSERT FUNCTION*)

fun insert key Empty = Leaf key
  | insert key (Leaf k) =
      if key < k then TwoNode (k, Leaf key, Empty)
      else TwoNode (k, Empty, Leaf key)
  | insert key (TwoNode (k, left, right)) =
      if key < k then TwoNode (k, insert key left, right)
      else TwoNode (k, left, insert key right)
  | insert key (ThreeNode (k1, k2, left, middle, right)) =
      if key < k1 then ThreeNode (k1, k2, insert key left, middle, right)
      else if key < k2 then ThreeNode (k1, k2, left, insert key middle, right)
      else ThreeNode (k1, k2, left, middle, insert key right);

(* Test Case for Insert, Delete, and Traverse *)

(* Create an empty tree *)
val tree = Empty;

(* Insert keys into the tree *)
val tree1 = insert 20 tree;  (* Insert 20 -> Should return Leaf 20 *)
val tree2 = insert 10 tree1; (* Insert 10 -> Should return TwoNode (10, Leaf 20, Empty) *)
val tree3 = insert 30 tree2; (* Insert 30 -> Should return TwoNode (10, Leaf 20, Leaf 30) *)
val tree4 = insert 15 tree3; (* Insert 15 -> Should return TwoNode (10, Leaf 20, TwoNode (15, Leaf 30, Empty)) *)
val tree5 = insert 25 tree4; (* Insert 25 -> Should return TwoNode (10, Leaf 20, TwoNode (15, Leaf 30, Leaf 25)) *)

(* Traverse the tree to check sorted order after insertions *)
val sortedAfterInsert = traverse tree5;  
(* Should output: [10, 15, 20, 25, 30] *)

(* Delete a key from the tree (e.g., delete 15) *)
val treeAfterDelete1 = delete 15 tree5;  
(* Should output: [10, 20, 25, 30] *)

(* Traverse again to check the tree after deletion *)
val sortedAfterDelete1 = traverse treeAfterDelete1;  
(* Should output: [10, 20, 25, 30] *)

(* Delete a key from the tree (e.g., delete 10) *)
val treeAfterDelete2 = delete 10 treeAfterDelete1;  
(* Should output: [20, 25, 30] *)

(* Traverse again to check the tree after deletion *)
val sortedAfterDelete2 = traverse treeAfterDelete2;  
(* Should output: [20, 25, 30] *)

(* Delete a key from the tree (e.g., delete 30) *)
val treeAfterDelete3 = delete 30 treeAfterDelete2;  
(* Should output: [20, 25] *)

(* Traverse again to check the tree after deletion *)
val sortedAfterDelete3 = traverse treeAfterDelete3;  
(* Should output: [20, 25] *)

(* Finally, delete the last key (e.g., delete 25) *)
val treeAfterDelete4 = delete 25 treeAfterDelete3;  
(* Should output: [20] *)

(* Traverse the final tree after all deletions *)
val sortedAfterDelete4 = traverse treeAfterDelete4;  
(* Should output: [20] *)

(* Delete the last remaining key (e.g., delete 20) *)
val treeAfterDelete5 = delete 20 treeAfterDelete4;  
(* Should output: [] (Empty tree) *)

(* Traverse the final empty tree *)
val sortedAfterDelete5 = traverse treeAfterDelete5;  
(* Should output: [] (Empty tree) *)

(* Print all intermediate results *)
val _ = print ("After insert: " ^ String.concatWith ", " (List.map Int.toString sortedAfterInsert) ^ "\n");
val _ = print ("After delete 15: " ^ String.concatWith ", " (List.map Int.toString sortedAfterDelete1) ^ "\n");
val _ = print ("After delete 10: " ^ String.concatWith ", " (List.map Int.toString sortedAfterDelete2) ^ "\n");
val _ = print ("After delete 30: " ^ String.concatWith ", " (List.map Int.toString sortedAfterDelete3) ^ "\n");
val _ = print ("After delete 25: " ^ String.concatWith ", " (List.map Int.toString sortedAfterDelete4) ^ "\n");
val _ = print ("After delete 20: " ^ String.concatWith ", " (List.map Int.toString sortedAfterDelete5) ^ "\n");


