from flask import Flask

app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Hello World!'


@app.route('/wangyusen')
def hello_world_wangyusen():
    return 'Hello World!  王钰森 '

@app.route('/guohaozhu')
def hello_world_guohaozhu():
    return 'Hello World!  郭浩柱 '

if __name__ == '__main__':
    app.run()
