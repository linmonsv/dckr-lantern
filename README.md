# Latern latest based on openSuse:tumbleweed
-
[![](https://images.microbadger.com/badges/image/webdeskltd/lantern.svg)](https://microbadger.com/images/webdeskltd/lantern "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/webdeskltd/lantern.svg)](https://microbadger.com/images/webdeskltd/lantern "Get your own version badge on microbadger.com")

Run it:

	`docker run -d -p 3128:3128 -p 16823:16823 webdeskltd/lantern`
or

	`docker run -t -i --rm -p 3128:3128 -p 16823:16823 webdeskltd/lantern`

Next, set your browser proxy settings: `HTTP proxy = http://localhost:3128`
or
proxy auto-config pac script: `http://localhost:16823/proxy_on.pac?nocache=1`
