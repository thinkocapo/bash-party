import os
from flask import Flask, request, json, abort
from flask_cors import CORS
import subprocess
from subprocess import Popen, PIPE
from subprocess import check_output

# import sentry_sdk
# from sentry_sdk.integrations.flask import FlaskIntegration
# sentry_sdk.init(
#     dsn="",
#     integrations=[FlaskIntegration()],
#     release=os.environ.get("VERSION")
# )

app = Flask(__name__)
CORS(app)

print "YEAAAH"

@app.route('/send', methods=['GET'])
def send():
    print "----------- SENDING... ----------'"
    # subprocess.call(['./boom.sh'], stdout=PIPE, stderr=PIPE)

    # session = subprocess.Popen(['./boom.sh'], stdout=PIPE, stderr=PIPE)
    # stdout, stderr = session.communicate()
    # if stderr:
    #     raise Exception("Error "+str(stderr))
    # return stdout.decode('utf-8')

    # MAYBE STOP the process then run boom.sh
    stdout = check_output(['./boom.sh']).decode('utf-8')
    return stdout

    return "SUCCESS"


# IGNORE
@app.route('/download', methods=['GET'])
def download():
    try:
        print "things"
    except Exception as err:
        abort(500)
    # works if they're doing "curl localhost/download | bash"
    return 'echo $PATH'