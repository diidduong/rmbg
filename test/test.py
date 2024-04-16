from rembg import remove
from PIL import Image

input = Image.open('rock.jpg')
output = remove(input)

output.save('rock-removed.png')