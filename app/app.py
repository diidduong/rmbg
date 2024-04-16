from flask import Flask, request, render_template, send_file
from rembg import remove
from PIL import Image
from io import BytesIO

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def upload_file():
    if request.method == 'POST':
        if 'file' not in request.files:
            return 'File Not Found', 400
        file = request.files['file']
        if file:
            input_img = Image.open(file.stream)
            output_img = remove(input_img, post_process_mask=True)
            img_io = BytesIO()
            output_img.save(img_io, format='PNG')
            img_io.seek(0) # go back to start of byte array
            return send_file(img_io, mimetype='image/png', as_attachment=True, download_name='output.png')
        return 'Invalid File Format', 400

    return render_template('index.html')


if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True, port=5100)