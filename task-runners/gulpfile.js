const gulp = require("gulp");
const runSequence = require("run-sequence");
const exec = require("child_process").exec;

const relaunchCommand = "~/Scripts/ccq/ccq.sh";

gulp.task("default", () => {
  runSequence("relaunchPS", () => {
    gulp.watch(["**/*.jsx"], ["relaunchPS"]);
  });
});

gulp.task("relaunchPS", (cb) => {
  exec(relaunchCommand, (err, stdout, stderr) => {
    if (stdout) {console.log(stdout)};
    if (stderr) {console.log(stderr)};

    cb(err);
  });
});
