import pokebase as pb
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import numpy
import pandas
import sqlite3

#rayquaza = pb.pokemon('rayquaza')

#print(rayquaza.name)

#for type_slot in rayquaza.types:
#    print('{}: {}'.format(type_slot.slot, type_slot.type.name.title()))

#if len(rayquaza.types) != 1:
#    print("2: " + rayquaza.types[1].type.name.title())

#for stats_slot in rayquaza.stats:
#    print('{}: {}'.format(stats_slot.stat.name.title(), stats_slot.base_stat))

#print(rayquaza.stats[0].stat.name.title() + str(rayquaza.stats[0].base_stat))

table = pandas.DataFrame()

#Create Array for each propertie to insert in Dataframe
pokemon_IDs = []
pokemon_names = []
pokemon_heights = []
pokemon_weights = []
pokemon_type1 = []
pokemon_type2 = []
pokemon_hp = []
pokemon_attack = []
pokemon_defense = []
pokemon_spattack = []
pokemon_spdefense = []
pokemon_speed = []
pokemon_img_url = []



#Get each property py order
searching_range = 905
for i in range(searching_range):
    j = i+1
    print("Searching for number: " + str(j) + " from " + str(searching_range) + "...")


    pokemon = pb.pokemon(j)
    
    
    
    #pokemon_IDs.append(j)
    #pokemon_names.append(pokemon.name)
    #pokemon_heights.append(pokemon.height/10)
    #pokemon_weights.append(pokemon.weight/10)
    #pokemon_type1.append(pokemon.types[0].type.name.title())

    if len(pokemon.types) != 1:
        with open("data.txt", "a") as file_object:
            file_object.write("{\"id\": \""+ str(j) +"\", \"name\": \"" + pokemon.name + "\",\"type1\": \" " + pokemon.types[0].type.name.title() + "\",\"type1\": \" " + pokemon.types[1].type.name.title() + "\"},\n")
    else:
        with open("data.txt", "a") as file_object:
            file_object.write("{\"id\": \""+ str(j) +"\", \"name\": \"" + pokemon.name + "\",\"type1\": \" " + pokemon.types[0].type.name.title() + "\",\"type1\": \"none\"},\n")



    #pokemon_hp.append(pokemon.stats[0].base_stat)
    #pokemon_attack.append(pokemon.stats[1].base_stat)
    #pokemon_defense.append(pokemon.stats[2].base_stat)
    #pokemon_spattack.append(pokemon.stats[3].base_stat)
    #pokemon_spdefense.append(pokemon.stats[4].base_stat)
    #pokemon_speed.append(pokemon.stats[5].base_stat)
    #img = pb.SpriteResource('pokemon', j)
    #pokemon_img_url.append(str(img.url))


#table = pandas.DataFrame({
#                        'Name': pokemon_names,
#                        'Height(M)': pokemon_heights,
#                        'Weight(Kg)': pokemon_weights,
#                        'Type 1': pokemon_type1,
#                        'Type 2': pokemon_type2,
#                        'HP': pokemon_hp,
#                        'Attack': pokemon_attack,
#                        'Defense': pokemon_defense,
#                        'Sp.Attack': pokemon_spattack,
#                        'Sp.Defense': pokemon_spdefense,
#                        'Speed': pokemon_speed,
#                        'Image-URL': pokemon_img_url,
#
#                        })

#table.index = pokemon_IDs

#print(table)

#plt.hist(pokemon_attack, color = 'yellow', edgecolor = 'black',
#         bins = int(300))

# Add labels
#plt.title('Attack')
#plt.xlabel('Value')
#plt.ylabel('Amount')
#plt.show()

        

#with open("pokedex_database.txt", "a") as file_object:
#    file_object.write("CREATE TABLE IF NOT EXISTS pokemons (ID INTEGER, Name TEXT, Height REAL, Weight REAL, Type_1 TEXT, Type_2 TEXT, Hp INTEGER, Attack INTEGER, Defense INTEGER, Sp_Attack INTEGER, Sp_Defense INTEGER, Speed INTEGER, Image_url VARCHAR(200));\n")
#    for row in table.itertuples():
#        print("Saving number: " + str(row) + " from " +  str(searching_range) +"...")
#        insert_sql = f"INSERT INTO pokemons (ID, Name, Height, Weight, Type_1, Type_2, Hp, Attack, Defense, Sp_Attack, Sp_Defense, Speed, Image_url) VALUES ({row[0]},'{row[1]}',{row[2]},{row[3]},'{row[4]}','{row[5]}',{row[6]},{row[7]},{row[8]},{row[9]},{row[10]},{row[11]},'{row[12]}');\n"
#        file_object.write(insert_sql)
        


