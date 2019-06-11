import os
from flask import Flask, request, json, abort
from flask_cors import CORS

# import sentry_sdk
# from sentry_sdk.integrations.flask import FlaskIntegration
# sentry_sdk.init(
#     dsn="",
#     integrations=[FlaskIntegration()],
#     release=os.environ.get("VERSION")
# )

app = Flask(__name__)
CORS(app)

@app.route('/download', methods=['GET'])
def download():
    print "----------- download ----------'"
    try:
        print "things"
        # '2' + 2
    except Exception as err:
        abort(500)

    # TODO return shell script file? or plain text, which can be piped to | bash?
    # TODO file read for bash.party.sh? or just read it as a massive string getting exported?
    return 'echo $PATH'