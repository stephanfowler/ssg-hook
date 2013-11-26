ssg-hook
========

Post-commit builder for static site generators. Currently builds [Punch](https://github.com/laktek/punch) sites, but easily adapted.

Add this WebHook URL to your Punch repo:
```
http://example.com:8080/hooks/ssg/master
```
Run like this:
```
$ ./ssg-hook.js
