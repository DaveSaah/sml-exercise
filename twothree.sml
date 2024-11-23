(* Define the FamilyMember type *)
datatype FamilyMember = 
    Node of {
        memberId : string,
        title : string,
        firstName : string,
        midName : string,
        lastName : string,
        nickName : string,
        gender : string,
        fatherId : string,
        motherId : string,
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
    };

(* Define the BinaryTree type *)
datatype BinaryTree =
    Empty
  | TwoNode of FamilyMember * BinaryTree * BinaryTree
  | ThreeNode of FamilyMember * FamilyMember * BinaryTree * BinaryTree * BinaryTree;

(* Function to perform in-order traversal *)
fun inOrderTraversal Empty = []
  | inOrderTraversal (TwoNode (member, left, right)) =
      inOrderTraversal left @ [member] @ inOrderTraversal right
  | inOrderTraversal (ThreeNode (member1, member2, left, middle, right)) =
      inOrderTraversal left @ [member1] @ inOrderTraversal middle @ [member2] @ inOrderTraversal right;

(* Example Family Tree *)
val member1 = Node {memberId = "1", title = "Mr.", firstName = "John", midName = "Michael", lastName = "Doe", nickName = "Johnny", gender = "MALE", fatherId = "", motherId = "", email = "john.doe@example.com", phoneNumber = "123456789", numOfSiblings = 2, siblingsNames = ["Jane", "Mark"], placeOfBirth = "Osu", placeOfDeath = NONE, cemetery = NONE, jobs = ["Engineer", "Teacher"], status = "Married", yearOfBirth = 1975, monthOfBirth = "October", dayOfBirth = 10, yearOfDeath = NONE, monthOfDeath = NONE, dayOfDeath = NONE};
val member2 = Node {memberId = "2", title = "Ms.", firstName = "Jane", midName = "", lastName = "Doe", nickName = "Janie", gender = "FEMALE", fatherId = "", motherId = "", email = "jane.doe@example.com", phoneNumber = "987654321", numOfSiblings = 2, siblingsNames = ["John", "Mark"], placeOfBirth = "Osu", placeOfDeath = NONE, cemetery = NONE, jobs = ["Doctor"], status = "Single", yearOfBirth = 1980, monthOfBirth = "November", dayOfBirth = 15, yearOfDeath = NONE, monthOfDeath = NONE, dayOfDeath = NONE};
val member3 = Node {memberId = "3", title = "Mr.", firstName = "Mark", midName = "James", lastName = "Doe", nickName = "Markie", gender = "MALE", fatherId = "", motherId = "", email = "mark.doe@example.com", phoneNumber = "1122334455", numOfSiblings = 2, siblingsNames = ["John", "Jane"], placeOfBirth = "Mampong", placeOfDeath = NONE, cemetery = NONE, jobs = ["Artist", "Designer"], status = "Married", yearOfBirth = 1985, monthOfBirth = "January", dayOfBirth = 20, yearOfDeath = NONE, monthOfDeath = NONE, dayOfDeath = NONE};
val member4 = Node {memberId = "4", title = "Mrs.", firstName = "Emily", midName = "Grace", lastName = "Doe", nickName = "Em", gender = "FEMALE", fatherId = "", motherId = "", email = "emily.doe@example.com", phoneNumber = "223344556", numOfSiblings = 1, siblingsNames = ["Sarah"], placeOfBirth = "Tema", placeOfDeath = NONE, cemetery = NONE, jobs = ["Scientist"], status = "Widowed", yearOfBirth = 1972, monthOfBirth = "May", dayOfBirth = 22, yearOfDeath = NONE, monthOfDeath = NONE, dayOfDeath = NONE};
val member5 = Node {memberId = "5", title = "Mr.", firstName = "Samuel", midName = "Oliver", lastName = "Doe", nickName = "Sam", gender = "MALE", fatherId = "", motherId = "", email = "samuel.doe@example.com", phoneNumber = "667788990", numOfSiblings = 3, siblingsNames = ["Daniel", "Linda", "David"], placeOfBirth = "Accra", placeOfDeath = NONE, cemetery = NONE, jobs = ["Lawyer"], status = "Married", yearOfBirth = 1980, monthOfBirth = "April", dayOfBirth = 5, yearOfDeath = NONE, monthOfDeath = NONE, dayOfDeath = NONE};
val member6 = Node {memberId = "6", title = "Ms.", firstName = "Sarah", midName = "", lastName = "Doe", nickName = "Sally", gender = "FEMALE", fatherId = "", motherId = "", email = "sarah.doe@example.com", phoneNumber = "889977665", numOfSiblings = 2, siblingsNames = ["John", "Rachel"], placeOfBirth = "Tamale", placeOfDeath = NONE, cemetery = NONE, jobs = ["Nurse"], status = "Single", yearOfBirth = 1983, monthOfBirth = "February", dayOfBirth = 18, yearOfDeath = NONE, monthOfDeath = NONE, dayOfDeath = NONE};
val member7 = Node {memberId = "7", title = "Dr.", firstName = "Rachel", midName = "Anne", lastName = "Doe", nickName = "Rae", gender = "FEMALE", fatherId = "", motherId = "", email = "rachel.doe@example.com", phoneNumber = "998877665", numOfSiblings = 1, siblingsNames = ["Sarah"], placeOfBirth = "Kumasi", placeOfDeath = NONE, cemetery = NONE, jobs = ["Doctor"], status = "Married", yearOfBirth = 1978, monthOfBirth = "December", dayOfBirth = 12, yearOfDeath = NONE, monthOfDeath = NONE, dayOfDeath = NONE};
val member8 = Node {memberId = "8", title = "Mr.", firstName = "George", midName = "David", lastName = "Doe", nickName = "Geo", gender = "MALE", fatherId = "", motherId = "", email = "george.doe@example.com", phoneNumber = "445566778", numOfSiblings = 4, siblingsNames = ["Chris", "Linda", "Mark", "Ella"], placeOfBirth = "Accra", placeOfDeath = NONE, cemetery = NONE, jobs = ["Manager"], status = "Divorced", yearOfBirth = 1981, monthOfBirth = "June", dayOfBirth = 1, yearOfDeath = NONE, monthOfDeath = NONE, dayOfDeath = NONE};
val member9 = Node {memberId = "9", title = "Mrs.", firstName = "Linda", midName = "", lastName = "Doe", nickName = "Lindy", gender = "FEMALE", fatherId = "", motherId = "", email = "linda.doe@example.com", phoneNumber = "556677889", numOfSiblings = 3, siblingsNames = ["George", "Chris", "Ella"], placeOfBirth = "Takoradi", placeOfDeath = NONE, cemetery = NONE, jobs = ["Teacher"], status = "Single", yearOfBirth = 1987, monthOfBirth = "July", dayOfBirth = 19, yearOfDeath = NONE, monthOfDeath = NONE, dayOfDeath = NONE};
val member10 = Node {memberId = "10", title = "Mr.", firstName = "Chris", midName = "Samuel", lastName = "Doe", nickName = "Chris", gender = "MALE", fatherId = "", motherId = "", email = "chris.doe@example.com", phoneNumber = "667788990", numOfSiblings = 4, siblingsNames = ["George", "Linda", "Mark", "Ella"], placeOfBirth = "Cape Coast", placeOfDeath = NONE, cemetery = NONE, jobs = ["Engineer"], status = "Married", yearOfBirth = 1979, monthOfBirth = "March", dayOfBirth = 22, yearOfDeath = NONE, monthOfDeath = NONE, dayOfDeath = NONE};


(* Function to delete the in-order predecessor by memberId *)
fun deleteMax Empty = Empty
  | deleteMax (TwoNode (member, left, Empty)) = left
  | deleteMax (ThreeNode (member1, member2, left, middle, Empty)) = left
  | deleteMax (TwoNode (member, left, right)) = TwoNode (member, left, deleteMax right)
  | deleteMax (ThreeNode (member1, member2, left, middle, right)) = 
      ThreeNode (member1, member2, left, middle, deleteMax right);

inOrderTraversal (TwoNode (member1, Empty, Empty));



