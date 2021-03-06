# Client Proposal System

>  IdeaBase's client proposal system

## Setup Instructions

### Git

1.  Create a new repository under IdeaBase
2.  [Install Tower](https://www.git-tower.com/) or [GitHub Desktop](https://desktop.github.com/) (or use git in a terminal or shell)
3.  Log into GitHub and [clone the new repository](https://help.github.com/articles/cloning-a-repository/)
4.  Download the [IdeaBase Starter Kit 2.0 .zip file](https://github.com/ideabase/starter_kit2/archive/master.zip) and copy the files into your cloned repository
5.  Commit and push changes to your repository using "[Push - Tower](https://www.git-tower.com/help/mac/branches-and-tags/push)" or "[Publish - Github Desktop](https://services.github.com/on-demand/github-desktop/push-with-github-desktop)"

### MAMP (PHP, MySQL)

1.  [Install MAMP Pro](https://www.mamp.info/en/mamp-pro/)
2.  Under ports, check the setting "set server ports to 80, 81, 443, etc..."
3.  In the hosts tab, click the plus button underneath the table where "localhost" is listed to create a new host
4.  If using a CMS, create a local database and give it a name
5.  After creating the host, select it and set the document root to the `public/` or `html/` folder, **not** the project root
6.  Verify that the password for your database' is "root"
7.  Start the local server by pressing the start button in MAMP

### Composer

1.  In a terminal or shell, use cURL to download Composer as a .phar (PHP archive) file in your home directory
    ```sh
    curl -sS <https://getcomposer.org/installer> | php ~/
    ```
2.  Move the .phar file to the local computer binaries folder, and enter your password when prompted by the `sudo` command
    ```sh
    sudo mv ~/composer.phar /usr/local/bin/
    ```
3.  Establish a global alias for Composer in your shell profile
    ```sh
    vim ~/.bash_profile
    alias composer="php /usr/local/bin/composer.phar"
    ```
4.  Execute `composer` in your project to make sure the alias works globally
5.  If there are any issues with plugins, composer's PHP version can be specified in `craft/composer.json` and project dependencies can be updated with `composer update`
    ```json
    "config": {
      "platform": {
        "php": "7.0.15"
      }
    }
    ```

### Craft CMS

1.  Rename `craft/config/db-backup.php` to `db.php`
2.  Edit `craft/config/db-backup.php` file with your local database name
3.  You can "Ignore" the db.php file once it's been edited with the local info so there's no chance of it being overwritten to production
4.  **Important**: Rename the `public/htaccess` file to `.htaccess`
5.  In craft/config/general.php - change the LOCAL url to your local URL
6.  Go to `http://example.web/admin` to begin CMS setup

### Pattern Lab

-   If using Pattern Lab, change the "htaccess" file in the public/lab folder to .htaccess, which will automatically redirect visitors at `/lab` to the `/lab/public` directory

### Node

1.  [Install Node.js](https://nodejs.org/en/download/)
2.  In a terminal or shell, install Grunt and Sass globally with npm
    ```sh
    npm install -g grunt-cli sass
    ```
3.  In your project's web document root (the `public/` or `html/` folder), install the npm packages from package.json
    ```sh
    npm install
    ```
4.  Navigate to your project's web document root (the `public/` or `html/` folder) and execute the command `grunt` to ensure that Grunt is working properly

##### Grunt will do the following:

-   Compress (minify) CSS processed from SASS
-   Autoprefix CSS
-   Combine and compress all JavaScript files
-   Autobuild the Pattern Lab files (if needed)
-   Autorefresh the browser when HTML or CSS files are updated
