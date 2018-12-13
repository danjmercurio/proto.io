#!/usr/bin/python3
# by Dan Mercurio <dmercurio92@gmail.com>
from flask import Flask, render_template, request, redirect, flash, url_for
from werkzeug.utils import secure_filename

import uuid
import os
import subprocess
import MySQLdb

app = Flask(__name__)

def connect():
	return MySQLdb.connect(user="root", passwd="mysqlpassword", db="protoio")

@app.route("/")
def hello():
	return render_template('index.html')

@app.route("/upload", methods=["POST"])
def handle_upload():
	if request.form['patientid']:
		try:
			if request.files['sequenceFile1'] and request.files['sequenceFile2']:
				path = os.path.join('uploads', request.form['patientid'])
				print('Using path: ' + str(path))
				os.mkdir(path)
				
				file1 = request.files['sequenceFile1']
				file1filename = secure_filename(file1.filename)
				file1path = os.path.join(path, file1filename)
				file1.save(file1path)

				file2 = request.files['sequenceFile2']
				file2filename = secure_filename(file2.filename)
				file2path = os.path.join(path, file2filename)
				file2.save(file2path)

				# Invoke script 1
				# print(os.getcwd())
				# command = ['python', 'select_random_line.py', file1path, file2path]
				
				# output = subprocess.check_output(command)

				db = connect()
				c = db.cursor()
				insert_statement = """INSERT INTO `protoio` (`id`, `facility`, `patientid`, `collection_date`, `analysis_date`, `description`, `file1path`, `file2path`) VALUES (NULL, '{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}');""".format(request.form['facility'], request.form['patientid'], request.form['collectionDate'], request.form['analysisDate'], request.form['description'], file1path, file2path)
				c.execute(insert_statement)
				res = db.commit()
				c.close()
				return redirect(url_for('handle_list'))
			else:
				flash('Error: ensure both sequence files are uploaded')
				return redirect(url_for('hello'))
		# except FileNotFoundError:
		# 	flash('Error: ensure uploads subdirectory exists ' + str(os.getcwd()))
		# 	return redirect(url_for('hello'))
		except PermissionError:
			flash('Error: script does not have permission to create directories in /uploads')
	else:
		flash('Error: patient id is missing')
		return redirect(url_for('hello'))

@app.route('/list')
def handle_list():
	db = connect()
	c = db.cursor()
	c.execute("SELECT * FROM protoio")
	results = [dict(id=row[0],
                    facility=row[1],
                    patientid=row[2],
                    collectionDate=row[3],
                    analysisDate=row[4],
                    description=row[5],
                    file1path=row[6],
                    file2path=row[7]) for row in c.fetchall()]
	c.close()
	return render_template('list.html', results=results)

app.secret_key = 'INSERT REAL KEY HERE'
