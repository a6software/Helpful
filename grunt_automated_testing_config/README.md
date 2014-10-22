# Installation instructions for Ubuntu

The following instructions are for installing the pre-requisites to automatically run your codeception tests whenever a file is changed, in the "watched" folders on your server. 

There are some troubleshooting steps at the bottom of this file. 

If you're using an older version of Ubuntu, you may need to update:

sudo apt-get update -y && sudo apt-get upgrade -y

Run the above if you experience any strange 404 ip not found errors when carrying out the following:

* sudo apt-get install nodejs
* sudo apt-get install npm
* sudo npm install -g grunt-cli
* copy package.json to your web / project root folder
* copy gruntfile.js to your web / project root folder
* from your web / project root folder, run:
  * sudo npm install

To start, run:

grunt watch 

See below if this throws an error. 

This will take over your console session until you cancel (ctrl+c). 

Now, whenever a file in a 'watched' folder (anything in 'tests/unit/*' by default) changes, the codeception unit tests will re-run automatically. 

Feel free to edit, change, hack to your hearts content.  


## Troubleshooting

### FIX - /usr/bin/env: node: No such file or directory

Do one of the following:

sudo apt-get install nodejs-legacy

or

sudo ln -s /usr/bin/nodejs /usr/bin/node


### Strange 404 ip not found errors during 'sudo apt-get install npm'

Likely your installation of Ubuntu is old.

Re-run: sudo apt-get update -y && sudo apt-get upgrade -y
