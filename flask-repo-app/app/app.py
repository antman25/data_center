from flask import Flask, render_template

app = Flask(__name__)


@app.route('/')
@app.route('/index.yaml')
def index():
    with open('index.yaml','r') as f:
        index = f.read()
    return index


if __name__ == '__main__':
    app.run(debug=True)
