datatype family_member =
  FamilyMember of {
    memberId: int,               (* Unique identifier for each family member *)
    title: string,               (* Title e.g. Mr., Mrs., Ms., Dr., etc. *)
    firstName: string,           (* First name *)
    middleName: string,          (* Middle name *)
    lastName: string,            (* Last name *)
    nickname: string,            (* Nickname *)
    sex: string,                 (* Gender: MALE or FEMALE *)
    fatherId: int option,        (* Father's ID *)
    motherId: int option,        (* Mother's ID *)
    email: string,               (* Email address *)
    phoneNumber: string,         (* Phone number *)
    numberOfSiblings: int,       (* Number of siblings *)
    siblingNames: string list,   (* List of sibling names *)
    placeOfBirth: string,        (* Place of birth e.g. Osu, Asokore, Mampong *)
    placeOfDeath: string option, (* Place of death (if dead), None if alive *)
    cemetery: string option,     (* Cemetery (if dead), None if alive *)
    jobs: string list,           (* List of jobs this member has had *)
    status: string,              (* Status: Married, Single, Widow, etc. *)
    yearOfBirth: int,            (* Year of birth *)
    monthOfBirth: string,        (* Month of birth e.g. October *)
    dayOfBirth: int,             (* Day of birth e.g. 04 *)
    yearOfDeath: int option,     (* Year of death, None if alive *)
    monthOfDeath: string option, (* Month of death, None if alive *)
    dayOfDeath: int option       (* Day of death, None if alive *)
  }

fun intOptionToString NONE = "None"
  | intOptionToString (SOME value) = Int.toString value;

fun strOptionToString NONE = "None"
  | strOptionToString (SOME value) = value;

fun stringListToString lst = "[" ^ String.concatWith ", " lst ^ "]";

fun FamilyMemberToString (FamilyMember {
    memberId, title, firstName, middleName, lastName, nickname,
    sex, fatherId, motherId, email, phoneNumber, numberOfSiblings,
    siblingNames, placeOfBirth, placeOfDeath, cemetery, jobs, status,
    yearOfBirth, monthOfBirth, dayOfBirth, yearOfDeath, monthOfDeath, dayOfDeath
  }) = 
  let
    val basicInfo = 
      "ID: " ^ Int.toString memberId ^ "\n" ^
      "Name: " ^ title ^ " " ^ firstName ^ " " ^ middleName ^ " " ^ lastName ^ " (" ^ nickname ^ ")\n" ^
      "Sex: " ^ sex ^ "\n" ^
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
          "Number of Siblings: " ^ Int.toString numberOfSiblings ^ "\n" ^
          "Siblings: " ^ stringListToString siblingNames ^ "\n" ^
          "Jobs: " ^ stringListToString jobs ^ "\n" ^
          "Status: " ^ status ^ "\n";
  in
    basicInfo ^ additionalInfo ^ deathInfo
  end;

(* Add family members *)
val grandFather = FamilyMember {
    memberId = 1,
    title = "Mr",
    firstName = "John",
    middleName = "Smith",
    lastName = "Doe",
    nickname = "Johnny",
    sex = "Male",
    fatherId = NONE,
    motherId = NONE,
    email = "john.doe@example.com",
    phoneNumber = "123-456-7890",
    numberOfSiblings = 2,
    siblingNames = ["Paul", "Anna"],
    placeOfBirth = "Osu",
    placeOfDeath = NONE,
    cemetery = NONE,
    jobs = ["Farmer"],
    status = "Married",
    yearOfBirth = 1940,
    monthOfBirth = "January",
    dayOfBirth = 15,
    yearOfDeath = NONE,
    monthOfDeath = NONE,
    dayOfDeath = NONE
};

val grandMother = FamilyMember {
    memberId = 2,
    title = "Mrs",
    firstName = "Jane",
    middleName = "Alice",
    lastName = "Doe",
    nickname = "Janey",
    sex = "Female",
    fatherId = NONE,
    motherId = NONE,
    email = "jane.doe@example.com",
    phoneNumber = "987-654-3210",
    numberOfSiblings = 3,
    siblingNames = ["Mary", "Susan", "Linda"],
    placeOfBirth = "Mampong",
    placeOfDeath = NONE,
    cemetery = NONE,
    jobs = ["Teacher"],
    status = "Married",
    yearOfBirth = 1942,
    monthOfBirth = "March",
    dayOfBirth = 10,
    yearOfDeath = NONE,
    monthOfDeath = NONE,
    dayOfDeath = NONE
};

val father = FamilyMember {
    memberId = 3,
    title = "Mr",
    firstName = "James",
    middleName = "Robert",
    lastName = "Doe",
    nickname = "Jim",
    sex = "Male",
    fatherId = SOME 1,  (* Reference to grandfather's ID *)
    motherId = SOME 2,  (* Reference to grandmother's ID *)
    email = "james.doe@example.com",
    phoneNumber = "555-123-4567",
    numberOfSiblings = 2,
    siblingNames = ["Kofi", "Kwame"],
    placeOfBirth = "Osu",
    placeOfDeath = NONE,
    cemetery = NONE,
    jobs = ["Engineer"],
    status = "Married",
    yearOfBirth = 1970,
    monthOfBirth = "February",
    dayOfBirth = 20,
    yearOfDeath = NONE,
    monthOfDeath = NONE,
    dayOfDeath = NONE
};

val mother = FamilyMember {
    memberId = 4,
    title = "Mrs",
    firstName = "Sarah",
    middleName = "Kate",
    lastName = "Doe",
    nickname = "Sally",
    sex = "Female",
    fatherId = NONE,
    motherId = NONE,
    email = "sarah.doe@example.com",
    phoneNumber = "555-987-6543",
    numberOfSiblings = 2,
    siblingNames = ["Mary", "Julia"],
    placeOfBirth = "Obomeng",
    placeOfDeath = NONE,
    cemetery = NONE,
    jobs = ["Nurse"],
    status = "Married",
    yearOfBirth = 1975,
    monthOfBirth = "July",
    dayOfBirth = 30,
    yearOfDeath = NONE,
    monthOfDeath = NONE,
    dayOfDeath = NONE
};

val son = FamilyMember {
    memberId = 5,
    title = "Mr",
    firstName = "Michael",
    middleName = "David",
    lastName = "Doe",
    nickname = "Mike",
    sex = "Male",
    fatherId = SOME 3,
    motherId = SOME 4,
    email = "michael.doe@example.com",
    phoneNumber = "555-555-5555",
    numberOfSiblings = 1,
    siblingNames = ["Emily"],
    placeOfBirth = "Accra",
    placeOfDeath = NONE,
    cemetery = NONE,
    jobs = ["Doctor"],
    status = "Single",
    yearOfBirth = 2000,
    monthOfBirth = "April",
    dayOfBirth = 10,
    yearOfDeath = NONE,
    monthOfDeath = NONE,
    dayOfDeath = NONE
};

val daughter = FamilyMember {
    memberId = 6,
    title = "Ms",
    firstName = "Emily",
    middleName = "Grace",
    lastName = "Doe",
    nickname = "Em",
    sex = "Female",
    fatherId = SOME 3,
    motherId = SOME 4,
    email = "emily.doe@example.com",
    phoneNumber = "555-555-1234",
    numberOfSiblings = 1,
    siblingNames = ["Michael"],
    placeOfBirth = "Accra",
    placeOfDeath = NONE,
    cemetery = NONE,
    jobs = ["Artist"],
    status = "Married",
    yearOfBirth = 2002,
    monthOfBirth = "June",
    dayOfBirth = 5,
    yearOfDeath = NONE,
    monthOfDeath = NONE,
    dayOfDeath = NONE
};

print "\n\n";
print (FamilyMemberToString grandMother);
