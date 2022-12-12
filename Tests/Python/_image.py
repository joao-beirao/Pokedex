
searching_range = 905
for i in range(searching_range):
    print("Doing " + str(i))
    with open("allItems.txt", "a") as file_object:
        file_object.write("                        createItemFilteredByName(" + str(i+1) + ", NAME, filter),\n")