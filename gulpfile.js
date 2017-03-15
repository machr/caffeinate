//Requirements
var gulp = require('gulp');
var sass = require('gulp-sass');
var autoprefixer = require('gulp-autoprefixer');
var browserSync = require('browser-sync');
var sassdoc = require('sassdoc');
var cleanCSS = require('gulp-clean-css');
var concatCSS = require('gulp-concat-css');
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');
var rename = require('gulp-rename');
var sourcemaps = require('gulp-sourcemaps');
var gutil = require('gulp-util');
var imagemin = require('gulp-imagemin');
var pngquant = require('imagemin-pngquant');
var jpegtran = require('imagemin-jpegtran');
var gifsicle = require('imagemin-gifsicle');
var optipng = require('imagemin-optipng');

//Directories
var sassInput = './app/dev/scss/*.scss';
var jsInput = './app/dev/js/*.js';
var dist = './app/public/';

//BrowserSync server
gulp.task('browser-sync', ['sass','js', 'images'], function () {
// gulp.task('browser-sync', ['sass','js'], function () {
  browserSync({
    proxy: '127.0.0.1:4567',
    port: 4567,
    open: true,
    notify: false
  });
});

//Sass and CSS Minify
gulp.task('sass', function() {
  gulp.src( sassInput )
    .pipe( sass({includePaths: ['node_modules/susy/sass']}).on('error', sass.logError) )
    .pipe( autoprefixer( ['last 15 versions', '> 1%', 'ie 8', 'ie 7'], {cascade: true} ) )
    .pipe( gulp.dest( dist + '/stylesheets/' ) )
    .pipe( browserSync.reload({ stream: true }) )
      gulp.src( dist + 'stylesheets/*.css' )
    .pipe( cleanCSS().on('error', gutil.log) )
    .pipe( concat( 'style.min.css' ) )
    .pipe( gulp.dest( dist + '/stylesheets/' ) )
});

//JS
gulp.task('js', function() {
  gulp.src( jsInput)
  .pipe( concat( 'scripts.js' ).on('error', gutil.log) )
  .pipe( gulp.dest( dist + 'javascript/' ) )
  .pipe( uglify().on('error', gutil.log) )
  .pipe( rename({
      suffix: '.min'
    }))
  .pipe( gulp.dest( dist + 'javascript/' ) )
  .pipe( browserSync.reload({ stream: true }) )
})

gulp.task('images', function () {
    return gulp.src('/app/dev/images/**')
        .pipe(imagemin({
            progressive: true,
            svgoPlugins: [{removeViewBox: false}],
            use: [pngquant(), jpegtran(), optipng(), gifsicle()]
        }))
        .pipe(gulp.dest('/app/public/images'));
});


//Watch
gulp.task('watch', function() {
  gulp.watch( './app/**/+(erb|rb', browserSync.reload )
  gulp.watch( sassInput,['sass'] )
  gulp.watch( jsInput,['js'] )
  gulp.on('change', function( event ) {
    console.log('File ' + event.path + ' was ' + event.type + ', running tasks...');
  })
})

gulp.task( 'default', ['browser-sync','watch'] );
