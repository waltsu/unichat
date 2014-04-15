# Server for unichat

##Dependencies

Following packages are needed to run the backend:

* [node](http://nodejs.org/)
* [foreman](https://github.com/ddollar/foreman)

##Installation

Install node from [http://nodejs.org/download/](http://nodejs.org/download/)

Install foreman with gem:

```
gem install foreman
```

After that install project dependencies with `npm install`

Create file .env with proper settings (See `sample.env` for details)

Create database

Create tables with `foreman start init`

Running
-------

```
foreman start
```

To test that backend server is running correctly, go to `http://localhost:7000`
with your browser

