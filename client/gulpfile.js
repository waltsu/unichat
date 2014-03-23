var gulp = require('gulp'),
    uglify = require('gulp-uglify'),
    livereload = require('gulp-livereload'),
    browserify = require('browserify'),
    coffeeify = require('coffeeify'),
    sass = require('gulp-sass'),
    source = require('vinyl-source-stream'),
    streamify = require('gulp-streamify'),
    lr = require('tiny-lr'),
    server = lr(),
    path = require('path'),
    livereloadPort = 35729;


var paths = {
  scripts: ['app/**/*.coffee'],
  styles: ['app/styles/**/*.scss']
};

// using vinyl-source-stream:
compileCoffee = function (debug) {
  var bundleStream = browserify('./app/main.coffee')
    .transform('coffeeify')
    .bundle()
    .pipe(source('bundle.js'));
  if (!debug) {
    bundleStream.pipe(streamify(uglify()));
  }
  bundleStream
    .pipe(gulp.dest('./public/js/'))
    .pipe(livereload(server));
};

var compileStyles = function (opts) {
  return gulp.src(paths.styles)
    .pipe(sass(opts))
    .on('error', function(err) {
      console.log(err);
    })
    .pipe(gulp.dest('./public/styles'))
    .pipe(livereload(server));
};

gulp.task('coffee', function () {
  compileCoffee(true);
});
gulp.task('coffee-production', function () {
  compileCoffee(false);
});
gulp.task('styles', function () {
  compileStyles({sourceComments: 'map'});
});
gulp.task('styles-production', function () {
  compileStyles({outputStyle: 'compressed'});
});

gulp.task('copy-static', function () {
  gulp.src(['index.html'])
    .pipe(gulp.dest('public/'))
})

gulp.task('staticsvr', function(next) {
  var staticS = require('node-static'),
      server = new staticS.Server(),
      port = 8000;
  require('http').createServer(function (request, response) {
    request.addListener('end', function () {
      server.serve(request, response);
    }).resume();
  }).listen(port, function() {
    console.log('Server listening on port: ' + port);
    next();
  });
});

gulp.task('livereload', ['staticsvr'], function () {
  server.listen(livereloadPort, function (err) {
    if (err) return console.log(err);
  });
});

gulp.task('dev', function () {
  gulp.start('livereload', ['coffee', 'styles']);
  gulp.watch(paths.scripts, ['coffee']);
  gulp.watch(paths.styles, ['styles']);
});

// The default task (called when you run `gulp` from cli)
gulp.task('default', ['copy-static', 'coffee-production', 'styles-production']);
