#!groovy

/*
The MIT License
Copyright (c) 2015-, CloudBees, Inc., and a number of other of contributors
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.
        THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

node('linux') {


    currentBuild.result = "SUCCESS"

    try {

       stage 'Checkout'

            checkout scm

       stage 'Setup'

            sh 'rbenv local 2.3.1'
            sh 'gem install bundler'
            sh 'bundle install'

       stage 'build'

            sh 'bundle exec deploy.rb'

        }


    catch (err) {

        currentBuild.result = "FAILURE"

            mail body: "project build error is here: ${env.BUILD_URL}" ,
            from: 'jenkins@localhost',
            replyTo: 'scarlett.gately.clark@gmail.com',
            subject: 'project build failed',
            to: 'scarlett.gately.clark@gmail.com'

        throw err
    }

}