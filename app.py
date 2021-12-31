from flask import Flask, request, jsonify
from werkzeug.serving import WSGIRequestHandler
from deepspeech.STT import STT
app = Flask(__name__)

@app.route('/v1/image/convert_cartoon', methods = ['POST'])
def convert_cartoon():
    data = request.get_json()
    if 'image' not in data:
        return "", 400
    cartoon_img_data = cartoongan.convert(data['image'])
    return cartoon_img_data, 200
    
@app.route("/")
def index(): return "<h1>Welcome to puzzleleaf ml server !!</h1>"
if __name__ == "__main__":
    WSGIRequestHandler.protocol_version = "HTTP/1.1"
    app.run(threaded=True, host='0.0.0.0', port=5000)
    
