/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

list1 = ["user","documents","directory"]
list2 = ["red","green","blue"]
list3 = ["0-10","11-20","21-30"]

randomize()

elem1 = list1 [irandom_range(0,2)]
elem2 = list2 [irandom_range(0,2)]
elem3 = list3 [irandom_range(0,2)]

randompath = "Search for : " + string(elem1) + "/ " + string(elem2) + "/ " + string(elem3)

i = 0
canmove = 1
canpress = 1

alarm_set(1, 5)