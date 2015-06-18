gulp = require("gulp")
# css
compass = require("gulp-compass")
autoprefixer = require("gulp-autoprefixer")
csso = require("gulp-csso")
# js
concat = require("gulp-concat")
uglify = require("gulp-uglify")
# img
imagemin = require('gulp-imagemin')
pngquant = require('imagemin-pngquant')


paths = {
  cssSource: "source/css"
}

gulp.task "css", ->
  gulp.src "src/css/**/*.scss"
  .pipe compass
    config_file: "./config.rb"
    css: "src/css"
    sass: "src/css"

  .pipe autoprefixer
    browsers: ["last 6 version", "> 1%", "ie 8"]

  .pipe(csso())
  .pipe(gulp.dest("public/css"))





#gulp.task "concat", ->
#  gulp.src([
#      "./source/js/lib/jquery-1.11.1.min.js"
#      "./source/js/lib/jquery.placeholder.js"
#      "./source/js/lib/modernizr.custom.js"
#  ])
#    .pipe(concat("lib.js"))
#    .pipe(gulp.dest("./source/js"))
#
#  gulp.src([
#    "./source/js/scr/main.js"
#  ])
#    .pipe(concat("project.js"))
#    .pipe(gulp.dest("./source/js"))
#
#
#gulp.task "compress", ["concat"], ->
#  gulp.src("source/js/*.js")
#    .pipe(uglify())
#    .pipe(gulp.dest("public/js"))


gulp.task "img", ->
  gulp.src "./src/image/**/*"
  .pipe imagemin
      progressive: true,
      use: [pngquant()]

  .pipe(gulp.dest('public/image'))

gulp.task "w", ->
  gulp.watch("./src/css/**/*.scss", ["css"])
#  gulp.watch("./source/js/**/*.js", ["compress"])
  gulp.watch("./src/img/**/*", ["img"])

gulp.task("default", ["css", "img"])