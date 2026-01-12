import sqlite3
from flask import Flask, render_template, g, current_app

app = Flask(__name__)
DATABASE = 'blog.db'



def get_db():
    db = getattr(g, '_database', None)
    if db is None:
        db = g._database = sqlite3.connect(DATABASE)
        db.row_factory = sqlite3.Row
    return db


@app.teardown_appcontext
def close_connection(exception):
    db = getattr(g, '_database', None)
    if db is not None:
        db.close()


def init_db():
    with app.app_context():
        db = get_db()
        with current_app.open_resource('schema.sql', mode='r') as f:
            db.cursor().executescript(f.read())
        db.commit()


@app.route('/')
def index():
    db = get_db()

    posts = db.execute('SELECT id, title, content, created FROM posts ORDER BY created DESC').fetchall()

    return render_template('index.html', posts=posts)


if __name__ == '__main__':
    try:
        init_db()
        print(f"\n--- Initialized database: {DATABASE} ---\n")
    except sqlite3.OperationalError:
        print(f"\n--- Database already exists. Skipping initialization. ---\n")

    app.run(debug=True)