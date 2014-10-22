module.exports = function (grunt) {
    grunt.initConfig({
        exec: {
            run_only_unit_tests: {
                cmd: 'php vendor/codeception/codeception/codecept run unit'
            }
        },
        watch: {
            test: {
                files: ['tests/unit/**/*.*'],
                tasks: ['exec']
            }
        }
    });

    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-exec');
};
