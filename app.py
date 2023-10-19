from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/data')
def data():
    with open('data.json', 'r') as f:
        data = json.load(f)
    return jsonify(data)

if __name__ == "__main__":
    app.run(debug=True)

