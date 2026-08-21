from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello():
    return "<h1>Merhaba Dunya! DevOps stajina hos geldin.</h1>"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
