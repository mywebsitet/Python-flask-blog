from flask import Flask, render_template, request ,session,redirect
from flask_sqlalchemy import SQLAlchemy
from werkzeug.utils import secure_filename
from datetime import datetime
from flask_mail import Mail
import json
import os
import math


with open('config.json', 'r') as c:
    params = json.load(c)['params']

app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['UPLOAD_FOLDER'] = params['upload_path']
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = True,
    MAIL_USERNAME =  params['gmail-user'],
    MAIL_PASSWORD =   params['gmail-password']
)
mail = Mail(app)
local_setver = True

if(local_setver):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
     app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']



db = SQLAlchemy(app)


class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(20), nullable=False)
    phone_num = db.Column(db.String(12), nullable=False)
    sms = db.Column(db.String(500), nullable=False)
    date = db.Column(db.String(12), nullable=True)

class Post(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    slug = db.Column(db.String(20), nullable=False)
    content = db.Column(db.String(500), nullable=False)
    date = db.Column(db.String(12), nullable=True) 
    img_file = db.Column(db.String(12), nullable=True) 

@app.route("/")
def home():
    posts = Post.query.filter_by().all()
    last = math.ceil(len(posts)/int(params['no_of_post']))
    page = request.args.get('page')
    if (not str(page).isnumeric()):
        page = 1
    
    page = int(page)

    posts = posts[(page-1) * int(params['no_of_post']):(page-1) * int(params['no_of_post']) + int(params['no_of_post']) ]

    if (page == 1):
        prev = "#"
        next = "/?page=" + str(page + 1)
    elif (page == last):
        next = "#"
        prev ="/?page=" + str(page - 1)
    else:
        next = "/?page=" + str(page + 1)
        prev = "/?page=" + str(page - 1)

    return render_template('index.html', params = params, posts = posts, next = next, prev = prev)


@app.route("/about")
def about():
    return render_template('about.html', params = params)


@app.route("/contact", methods = ['GET', 'POST'])
def contact():
    if(request.method=='POST'):
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        entry = Contacts(name=name, email = email, phone_num = phone,sms = message, date=datetime.now() )
        db.session.add(entry)
        db.session.commit()
        # mail.send_message('New message from ' + name,
        #                   sender=email,
        #                   recipients = [params['gmail-user']],
        #                   body = message + "\n" + phone
        #                   )
    return render_template('contact.html', params = params)

@app.route("/post/<string:post_slug>", methods=['GET'])
def post_route(post_slug):
    post = Post.query.filter_by(slug=post_slug ).first()
    return render_template('post.html', params = params, post=post)


@app.route("/dashbord",  methods = ['GET', 'POST'])
def dashbord():
    if( 'user' in session and session['user'] == params['username']):
        posts = Post.query.filter_by().all()
        return render_template('dashbord.html', params = params ,posts = posts)


    if request.method == 'POST':
        uname=request.form.get('uname')
        passw = request.form.get('pass')
        
        if (uname == params['username'] and passw == params['password']):
            session['user'] = uname
            posts = Post.query.filter_by().all()
            return render_template('dashbord.html', params = params,posts = posts)
    
    return render_template('login.html',params = params )

@app.route("/edit/<string:sno>", methods=['GET', 'POST'])
def edit(sno):
    if( 'user' in session and session['user'] == params['username']):
        if request.method == 'POST':
            box_title = request.form.get('title')
            slug = request.form.get('slug')
            content = request.form.get('content')
            # img_file1 = request.form.get('img_file')
            f = request.files['img_file']
            url = f.filename
            
            if sno == '0':
                posts = Post(title = box_title, slug = slug , content = content, date=datetime.now(), img_file = url)
                db.session.add(posts)
                db.session.commit()
                # f = request.files['img_file']
                f.save(os.path.join(app.config['UPLOAD_FOLDER'],secure_filename(f.filename)))
            else:
                post = Post.query.filter_by(sno=sno).first()
                post.title = box_title
                post.slug = slug
                post.content = content
                post.date = datetime.now()
                post.img_file = url
                db.session.commit()
                # f = request.files['img_file']
                f.save(os.path.join(app.config['UPLOAD_FOLDER'],secure_filename(f.filename)))
                return redirect('/edit/'+sno)

        post = Post.query.filter_by(sno=sno).first()
        return render_template('edit.html', params = params,sno=sno, post = post)
   
@app.route("/log_out")
def log_out():
    session.pop('user')
    return redirect('/dashbord')

@app.route("/delete/<string:sno>")
def delete(sno):
    if( 'user' in session and session['user'] == params['username']):
        post=Post.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashbord')

app.run(debug=True)


