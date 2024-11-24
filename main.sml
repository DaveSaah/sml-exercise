datatype FamilyMember =
  Node of {
    memberId : int,
    title : string,
    firstName : string,
    midName : string,
    lastName : string,
    nickName : string,
    gender : string,
    fatherId : int option,
    motherId : int option,
    email : string,
    phoneNumber : string,
    numOfSiblings : int,
    siblingsNames : string list,
    placeOfBirth : string,
    placeOfDeath : string option,
    cemetery : string option,
    jobs : string list,
    status : string,
    yearOfBirth : int,
    monthOfBirth : string,
    dayOfBirth : int,
    yearOfDeath : int option,
    monthOfDeath : string option,
    dayOfDeath : int option
  }

fun intOptionToString NONE = "None"
  | intOptionToString (SOME value) = Int.toString value;

fun strOptionToString NONE = "None"
  | strOptionToString (SOME value) = value;

fun stringListToString lst = "[" ^ String.concatWith ", " lst ^ "]";

fun FamilyMemberToString (Node {
    memberId, title, firstName, midName, lastName, nickName,
    gender, fatherId, motherId, email, phoneNumber, numOfSiblings,
    siblingsNames, placeOfBirth, placeOfDeath, cemetery, jobs, status,
    yearOfBirth, monthOfBirth, dayOfBirth, yearOfDeath, monthOfDeath, dayOfDeath
  }) = 
  let
    val basicInfo = 
      "ID: " ^ Int.toString memberId ^ "\n" ^
      "Name: " ^ title ^ " " ^ firstName ^ " " ^ midName ^ " " ^ lastName ^ " (" ^ nickName ^ ")\n" ^
      "Sex: " ^ gender ^ "\n" ^
      "Birthday: " ^ Int.toString dayOfBirth ^ " " ^ monthOfBirth ^ " " ^ Int.toString yearOfBirth ^ "\n" ^
      "Place of Birth: "  ^ placeOfBirth ^ "\n" ^
      "Father ID: " ^ intOptionToString fatherId ^ "\n" ^
      "Mother ID: " ^ intOptionToString motherId ^ "\n";

    val deathInfo =
      "Death: " ^
      (case yearOfDeath of NONE => "Alive\n"
      | SOME y => intOptionToString dayOfDeath ^ " " ^
                  strOptionToString monthOfDeath ^ " " ^
                  Int.toString y ^ "\n" ^
                  "Place of Death: " ^ strOptionToString placeOfDeath ^ "\n" ^
                  "Cemetery: " ^ strOptionToString cemetery ^ "\n");

        val additionalInfo =
          "Email: " ^ email ^ "\n" ^
          "Phone: " ^ phoneNumber ^ "\n" ^
          "Number of Siblings: " ^ Int.toString numOfSiblings ^ "\n" ^
          "Siblings: " ^ stringListToString siblingsNames ^ "\n" ^
          "Jobs: " ^ stringListToString jobs ^ "\n" ^
          "Status: " ^ status ^ "\n";
  in
    basicInfo ^ additionalInfo ^ deathInfo
  end;

(* Example Family Members (expanded to 10 members) *)
val member1 = Node {memberId = 1, title = "Mr.", firstName = "Anna", midName = "Michael", lastName = "Doe", 
                    nickName = "Johnny", gender = "MALE", fatherId = NONE, motherId = NONE, email = "john.doe@example.com", 
                    phoneNumber = "123456789", numOfSiblings = 2, siblingsNames = ["Jane", "Mark"], placeOfBirth = "Osu", 
                    placeOfDeath = NONE, cemetery = NONE, jobs = ["Engineer", "Teacher"], status = "Married", 
                    yearOfBirth = 1975, monthOfBirth = "October", dayOfBirth = 10, yearOfDeath = NONE, 
                    monthOfDeath = NONE, dayOfDeath = NONE};

val member2 = Node {memberId = 2, title = "Ms.", firstName = "Jane", midName = "", lastName = "Doe", 
                    nickName = "Janie", gender = "FEMALE", fatherId = NONE, motherId = NONE, email = "jane.doe@example.com", 
                    phoneNumber = "987654321", numOfSiblings = 2, siblingsNames = ["John", "Mark"], placeOfBirth = "Osu", 
                    placeOfDeath = NONE, cemetery = NONE, jobs = ["Doctor"], status = "Single", yearOfBirth = 1980, 
                    monthOfBirth = "November", dayOfBirth = 15, yearOfDeath = NONE, monthOfDeath = NONE, dayOfDeath = NONE};

val member3 = Node {memberId = 3, title = "Mr.", firstName = "Mark", midName = "James", lastName = "Doe", 
                    nickName = "Markie", gender = "MALE", fatherId = NONE, motherId = NONE, email = "mark.doe@example.com", 
                    phoneNumber = "1122334455", numOfSiblings = 2, siblingsNames = ["John", "Jane"], placeOfBirth = "Mampong", 
                    placeOfDeath = NONE, cemetery = NONE, jobs = ["Artist", "Designer"], status = "Married", 
                    yearOfBirth = 1985, monthOfBirth = "January", dayOfBirth = 20, yearOfDeath = NONE, 
                    monthOfDeath = NONE, dayOfDeath = NONE};

val member4 = Node {memberId = 4, title = "Mr.", firstName = "Luke", midName = "", lastName = "Doe", 
                    nickName = "Lucky", gender = "MALE", fatherId = NONE, motherId = NONE, email = "luke.doe@example.com", 
                    phoneNumber = "334455667", numOfSiblings = 3, siblingsNames = ["John", "Jane", "Mark"], placeOfBirth = "Kumasi", 
                    placeOfDeath = NONE, cemetery = NONE, jobs = ["Lawyer"], status = "Single", yearOfBirth = 1990, 
                    monthOfBirth = "April", dayOfBirth = 5, yearOfDeath = NONE, monthOfDeath = NONE, dayOfDeath = NONE};

val member5 = Node {memberId = 5, title = "Ms.", firstName = "Linda", midName = "Marie", lastName = "Doe", 
                    nickName = "Lina", gender = "FEMALE", fatherId = NONE, motherId = NONE, email = "linda.doe@example.com", 
                    phoneNumber = "223344556", numOfSiblings = 3, siblingsNames = ["John", "Mark", "Luke"], placeOfBirth = "Takoradi", 
                    placeOfDeath = NONE, cemetery = NONE, jobs = ["Architect"], status = "Married", 
                    yearOfBirth = 1992, monthOfBirth = "June", dayOfBirth = 22, yearOfDeath = NONE, 
                    monthOfDeath = NONE, dayOfDeath = NONE};

val member6 = Node {memberId = 6, title = "Mr.", firstName = "James", midName = "", lastName = "Doe", 
                    nickName = "Jamie", gender = "MALE", fatherId = NONE, motherId = NONE, email = "james.doe@example.com", 
                    phoneNumber = "998877665", numOfSiblings = 3, siblingsNames = ["John", "Mark", "Luke"], placeOfBirth = "Accra", 
                    placeOfDeath = NONE, cemetery = NONE, jobs = ["Pilot"], status = "Single", yearOfBirth = 1995, 
                    monthOfBirth = "March", dayOfBirth = 11, yearOfDeath = NONE, monthOfDeath = NONE, dayOfDeath = NONE};

val member7 = Node {memberId = 7, title = "Ms.", firstName = "Sophia", midName = "", lastName = "Doe", 
                    nickName = "Sophie", gender = "FEMALE", fatherId = NONE, motherId = NONE, email = "sophia.doe@example.com", 
                    phoneNumber = "445566778", numOfSiblings = 3, siblingsNames = ["John", "Mark", "Luke"], placeOfBirth = "Kumasi", 
                    placeOfDeath = NONE, cemetery = NONE, jobs = ["Teacher"], status = "Single", 
                    yearOfBirth = 1998, monthOfBirth = "December", dayOfBirth = 18, yearOfDeath = NONE, 
                    monthOfDeath = NONE, dayOfDeath = NONE};

val member8 = Node {memberId = 8, title = "Mr.", firstName = "Benjamin", midName = "Samuel", lastName = "Doe", 
                    nickName = "Ben", gender = "MALE", fatherId = NONE, motherId = NONE, email = "benjamin.doe@example.com", 
                    phoneNumber = "667788990", numOfSiblings = 3, siblingsNames = ["John", "Mark", "Luke"], placeOfBirth = "Tema", 
                    placeOfDeath = NONE, cemetery = NONE, jobs = ["Engineer"], status = "Married", 
                    yearOfBirth = 2000, monthOfBirth = "August", dayOfBirth = 25, yearOfDeath = NONE, 
                    monthOfDeath = NONE, dayOfDeath = NONE};

val member9 = Node {memberId = 9, title = "Mr.", firstName = "Daniel", midName = "", lastName = "Doe", 
                    nickName = "Dan", gender = "MALE", fatherId = NONE, motherId = NONE, email = "daniel.doe@example.com", 
                    phoneNumber = "556677889", numOfSiblings = 3, siblingsNames = ["John", "Mark", "Luke"], placeOfBirth = "Ashanti", 
                    placeOfDeath = NONE, cemetery = NONE, jobs = ["Doctor"], status = "Single", yearOfBirth = 2002, 
                    monthOfBirth = "January", dayOfBirth = 30, yearOfDeath = NONE, monthOfDeath = NONE, dayOfDeath = NONE};

val member10 = Node {memberId = 10, title = "Ms.", firstName = "Emma", midName = "", lastName = "Doe", 
                    nickName = "Em", gender = "FEMALE", fatherId = NONE, motherId = NONE, email = "emma.doe@example.com", 
                    phoneNumber = "112233445", numOfSiblings = 3, siblingsNames = ["John", "Mark", "Luke"], placeOfBirth = "Volta", 
                    placeOfDeath = NONE, cemetery = NONE, jobs = ["Nurse"], status = "Single", 
                    yearOfBirth = 2005, monthOfBirth = "July", dayOfBirth = 1, yearOfDeath = NONE, 
                    monthOfDeath = NONE, dayOfDeath = NONE};

(* Define the BinaryTree type *)
datatype BinaryTree = Empty
  | TwoNode of FamilyMember * BinaryTree * BinaryTree
  | ThreeNode of FamilyMember * FamilyMember * BinaryTree * BinaryTree * BinaryTree;

(* Function to perform in-order traversal and display selected fields (id, firstName, lastName) *)
fun inOrderTraversal Empty = []
  | inOrderTraversal (TwoNode (Node {memberId, firstName, lastName, ...}, left, right)) =
      inOrderTraversal left @ [(memberId, firstName, lastName)] @ inOrderTraversal right
  | inOrderTraversal (ThreeNode (Node {memberId = memberId1, firstName = firstName1, lastName = lastName1, ...}, 
                                 Node {memberId = memberId2, firstName = firstName2, lastName = lastName2, ...}, 
                                 left, middle, right)) =
      inOrderTraversal left @ 
      [(memberId1, firstName1, lastName1)] @ 
      inOrderTraversal middle @ 
      [(memberId2, firstName2, lastName2)] @ 
      inOrderTraversal right;

fun insert Empty newMember = TwoNode (newMember, Empty, Empty)
  | insert (TwoNode (member, left, right)) newMember =
      let
        val Node {memberId = id1, ...} = member
        val Node {memberId = id2, ...} = newMember
      in
        if id2 < id1 then
          TwoNode (member, insert left newMember, right)
        else
          TwoNode (member, left, insert right newMember)
      end
  | insert (ThreeNode (member_1, member_2, left, middle, right)) newMember =
      let
        val Node {memberId = id1, ...} = member_1
        val Node {memberId = id2, ...} = member_2
        val Node {memberId = id3, ...} = newMember
      in
        if id3 < id1 then
          ThreeNode (member_1, member_2, insert left newMember, middle, right)
        else if id3 < id2 then
          ThreeNode (member_1, member_2, left, insert middle newMember, right)
        else
          ThreeNode (member_1, member_2, left, middle, insert right newMember)
      end;


(* Search function to find a FamilyMember by their memberId in the tree *)
fun search Empty _ = NONE
  | search (TwoNode (Node {memberId, firstName, lastName, ...}, left, right)) searchId =
      if searchId = memberId then
        SOME (memberId, firstName, lastName)  (* Return tuple with memberId, firstName, and lastName *)
      else if searchId < memberId then
        search left searchId
      else
        search right searchId
  | search (ThreeNode (Node {memberId = id1, firstName = firstName1, lastName = lastName1, ...}, 
                       Node {memberId = id2, firstName = firstName2, lastName = lastName2, ...}, left, middle, right)) searchId =
      if searchId = id1 then
        SOME (id1, firstName1, lastName1)  (* Return tuple for the first member *)
      else if searchId = id2 then
        SOME (id2, firstName2, lastName2)  (* Return tuple for the second member *)
      else if searchId < id1 then
        search left searchId
      else if searchId < id2 then
        search middle searchId
      else
        search right searchId;

fun getMemberId (Node {memberId, ...}) = memberId;

fun findMin (TwoNode (m, Empty, _)) = m
  | findMin (TwoNode (_, left, _)) = findMin left
  | findMin _ = raise Fail "Tree is not a valid two-node structure for min";

(* Function to delete a node from the binary tree *)
fun delete Empty _ = Empty
  | delete (TwoNode (node, left, right)) memberIdToDelete =
      let
        val Node {memberId, ...} = node
      in
        if memberIdToDelete = memberId then
          (* Case 1: No children or one child *)
          if left = Empty then right
          else if right = Empty then left
          else
            (* Case 2: Two children - find the in-order successor and delete it *)
            let
              val minNode = findMin right
              val rightWithoutMin = delete right (getMemberId minNode) (* Delete the min node from the right subtree *)
            in
              TwoNode (minNode, left, rightWithoutMin)
            end
        else if memberIdToDelete < memberId then
          TwoNode (node, delete left memberIdToDelete, right)
        else
          TwoNode (node, left, delete right memberIdToDelete)
      end
  | delete (ThreeNode (node1, node2, left, middle, right)) memberIdToDelete =
      let
        val Node {memberId = id1, ...} = node1
        val Node {memberId = id2, ...} = node2
      in
        if memberIdToDelete = id1 then
          (* Case 1: No children or one child for node1 *)
          if left = Empty then
            (* node1 has no left child, so replace it with right or middle subtree *)
            if right = Empty then middle else right
          else if middle = Empty then
            (* node1 has no middle child, replace it with left or right *)
            left
          else
            (* Case 2: node1 has two children - find in-order successor *)
            let
              val minNode = findMin middle
              val middleWithoutMin = delete middle (getMemberId minNode)
            in
              ThreeNode (minNode, node2, left, middleWithoutMin, right)
            end
        else if memberIdToDelete = id2 then
          (* Case 2: Same logic as above for node2 in ThreeNode *)
          if middle = Empty then
            if right = Empty then left
            else right
          else
            let
              val minNode = findMin right
              val rightWithoutMin = delete right (getMemberId minNode)
            in
              ThreeNode (node1, minNode, left, middle, rightWithoutMin)
            end
        else if memberIdToDelete < id1 then
          ThreeNode (node1, node2, delete left memberIdToDelete, middle, right)
        else if memberIdToDelete < id2 then
          ThreeNode (node1, node2, left, delete middle memberIdToDelete, right)
        else
          ThreeNode (node1, node2, left, middle, delete right memberIdToDelete)
      end;

val familyTree = Empty;
val familyTree = insert familyTree member1;
val familyTree = insert familyTree member2;
val familyTree = insert familyTree member3;
val familyTree = insert familyTree member4;
val familyTree = insert familyTree member5;
val familyTree = insert familyTree member6;
val familyTree = insert familyTree member7;
val familyTree = insert familyTree member8;
val familyTree = insert familyTree member9;
val familyTree = insert familyTree member10;

val familyTree = delete familyTree 5;

(* Traverse the tree *)
val familyList = inOrderTraversal familyTree;

(* Print the family members *)
List.app (fn (id, first, last) => print (Int.toString id ^ " " ^ first ^ " " ^ last ^ "\n")) familyList;

(* Example search for a member with memberId = 5 *)
val searchResult = search familyTree 5;

(*
print "\n\n";
print (FamilyMemberToString member2);
*)

(* 
(* Define a function to generate a JSON representation of a 2-3 tree *)
fun treeToJson Empty = "{ \"keys\": [], \"children\": [] }"
  | treeToJson (TwoNode (member, left, right)) = 
      let
        val Node {memberId = id, title, firstName, lastName, ...} = member
        val nodeName = title ^ " " ^ firstName ^ " " ^ lastName
        val leftJson = treeToJson left
        val rightJson = treeToJson right
      in
        "{ \"keys\": [ { \"id\": " ^ Int.toString id ^ 
        ", \"name\": \"" ^ nodeName ^ "\" } ], " ^
        "\"children\": [ " ^ leftJson ^ ", " ^ rightJson ^ " ] }"
      end
  | treeToJson (ThreeNode (member_1, member_2, left, middle, right)) = 
      let
        val Node {memberId = id1, title = t1, firstName = f1, lastName = l1, ...} = member_1
        val Node {memberId = id2, title = t2, firstName = f2, lastName = l2, ...} = member_2
        val nodeName1 = t1 ^ " " ^ f1 ^ " " ^ l1
        val nodeName2 = t2 ^ " " ^ f2 ^ " " ^ l2
        val leftJson = treeToJson left
        val middleJson = treeToJson middle
        val rightJson = treeToJson right
      in
        "{ \"keys\": [ " ^
        "{ \"id\": " ^ Int.toString id1 ^ ", \"name\": \"" ^ nodeName1 ^ "\" }, " ^
        "{ \"id\": " ^ Int.toString id2 ^ ", \"name\": \"" ^ nodeName2 ^ "\" } ], " ^
        "\"children\": [ " ^ leftJson ^ ", " ^ middleJson ^ ", " ^ rightJson ^ " ] }"
      end;

(* Wrap the JSON tree with the root node structure *)
fun treeToRootJson tree = 
    "{ \"type\": \"2-3 tree\", " ^
    "\"root\": " ^ treeToJson tree ^ " }";

(* Function to save JSON to a file *)
fun saveJsonToFile (filename, jsonOutput) =
    let
        val outStream = TextIO.openOut filename
    in
        TextIO.output (outStream, jsonOutput);
        TextIO.closeOut outStream
    end;

(* Convert a tree to JSON and save it *)
val jsonOutput = treeToRootJson familyTree;
val _ = saveJsonToFile ("tree_output.json", jsonOutput);
*)
