import os
from flask import Flask, request, json, abort
from flask_cors import CORS
app = Flask(__name__)
CORS(app)

#source ~/virtualenvs/bash_party/bin/activate
@app.route('/download', methods=['GET'])
def download():
    try:
        print "things"
    except Exception as err:
        abort(500)
    # return the entire ./boom.sh for running and have it download an mp3
    return 'echo $PATH'

#FLASK_APP=server.py
#flask run -p 5001