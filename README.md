
*IDRTROPDS Repository*

This repository contains a Django web application. The application is built using the Django framework, which is a powerful Python web framework for developing web applications quickly and efficiently.

***Installation***

To run this Django app locally, follow these steps:
Clone the repository to your local machine using the following command:
```
git clone https://github.com/your-username/django-app.git
Change into the project directory:
```
```
$cd idrtropids
Create a virtual environment:
```
```
python3 -m venv env
Activate the virtual environment:
```

**For macOS/Linux:**
```
source env/bin/activate
```

**For Windows:**

```
.\env\Scripts\activate
Install the dependencies:

pip install -r requirements.txt
Perform database migrations:
```

**Configuration**

The Django app can be configured through the settings.py file. This file contains various settings related to the app, such as database configuration, static file settings, and more. Review the settings.py file and modify the settings according to your requirements.

```
copy file .env.example to .env
$ cp .env.example .env

edit .env file with your database conf
--------.env file-------
DB_CONNECTION=django.db.backends.mysql
DB_HOST=
DB_PORT=
DB_NAME=
DB_USER=
DB_PASSWORD=
APP_URL=http://localhost:8000
GOOGLE_CLIENT_ID=1043339594187-t7qftsu8gj7vjgrs3usuje92n6l19kl3.apps.googleusercontent.com
SOCIAL_SECRET=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
--------.env file--------
```
```
========
set migration database with command
$python manage,py makemigrations
$python manage.py migrate
```
```
========
Start the development server:
$python manage.py runserver
Open your web browser and navigate to http://localhost:8000 to access the  app.

```

**Contributing**

If you would like to contribute to this Django app repository, you can follow these steps:

Fork the repository on GitHub.
Create a new branch with a descriptive name for your feature or bug fix.
Make the necessary changes and commit them.
Push your changes to your forked repository.
Submit a pull request to the original repository, describing your changes in detail.
Please ensure that your code follows the project's coding style and that you include appropriate tests for any new features or bug fixes.

License
The Django app in this repository is licensed under the MIT License. You are free to use, modify, and distribute the code in accordance with the terms specified in the license.
