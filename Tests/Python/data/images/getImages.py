## Importing Necessary Modules
import requests # to get image from the web
import shutil # to save it locally

## Set up the image URL and filename
#searching_range = 898
for i in range(8):
    image_url = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"+str(898+i)+".png"
    filename = "C:\Projects\Pokedex\Tests\Python\data\images\\" + str(898+i) + ".png";
    r = requests.get(image_url, stream = True)
    if r.status_code == 200:
    # Set decode_content value to True, otherwise the downloaded image file's size will be zero.
        r.raw.decode_content = True

    # Open a local file with wb ( write binary ) permission.
        with open(filename,'wb') as f:
            shutil.copyfileobj(r.raw, f)
        
        print('Image sucessfully Downloaded: ' + str(898+i))
    else:
        print('Image ' + str(898+i) +' Couldn\'t be retreived')

# Check if the image was retrieved successfully