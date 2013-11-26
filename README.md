## Post-commit publisher for Static Site Generators

Listens for webhook posts from GitHub, generates a website with Punch (or whatever you want), and moves it to S3.

### Installation

- run `$ npm install`
- Set a [Web hook](https://help.github.com/articles/post-receive-hooks) on your GitHub repo that points to your ssg-hook server:
```
http://example.com:8080/hooks/ssg
```

### Configuration

Adjust `build.sh` and `publish.sh` to suit your workflow. By default, they generate a Punch site (or whatever, see `scripts/build.sh`) and publish it to an S3 directory (as specified in `scripts/publish.sh`).

Configuration attributes:

- `gh_server` The GitHub server from which to pull code
- `temp` A directory to store code and site files
- `scripts`
    - `build` A script to run to build the site
    - `publish` A script to run to publish the site
- `accounts` An array of accounts or organizations whose repositories can be used with this server

### Usage

- run as executable: `$ ./ssg-hook.js`

---------------------------------------

Based on [jekyll-hook](https://github.com/developmentseed/jekyll-hook)