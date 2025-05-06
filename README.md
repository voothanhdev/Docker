# Docker Images

## Nginx
- Working on user `www` and `/project` directory

### ENV
- APP_DIR=/app
- NGINX_CONFIG: Nginx configuration (Eg: `client_body_buffer_size=512M`). Multiple configurations are separated by space

### Fix project file permission
<pre>permission [&lt;project path&gt;]</pre>
- Default: `/project` folder
### Update Nginx config
<pre>nginx-config &lt;key&gt;=&lt;value&gt; [&lt;key&gt;=&lt;value&gt;...]</pre>
### Create SSL key
<pre>create-ssl-key &lt;key name&gt;</pre>
- Generate `/etc/nginx/ssl/<key name>.key` & `/etc/nginx/ssl/<key name>.crt` files

### Create V-Host

#### PHP V-Host
<pre>
create-php-vhost [&lt;option&gt;=&lt;value&gt;...]
</pre>
- Options
    - `--help` `-h`: Help
    - `--folder`: Project folder (Default: `APP_DIR` env)
    - `--server-name`: Server name (Default: `localhost`)
    - `--php`: PHP server / PHP docker compose service (Default: `php`)
    - `--php-port`: PHP port (Default: `9000`)
    - `--https`: Used HTTPS `true`/`false` (Default: `true`)
    - `--varnish-host`: Varnish host (Empty is not use varnish)
    - `--varnish-port`: Varnish port (Default: `6081`)
#### Magento V-Host
<pre>
create-magento-vhost [&lt;option&gt;=&lt;value&gt;...]
</pre>
- Options
    - `--help` `-h`: Help
    - `--folder`: Project folder (Default: `\project`)
    - `--server-name`: Server name (Default: `localhost`)
    - `--php`: PHP server / PHP docker compose service (Default: `php`)
    - `--php-port`: PHP port (Default: `9000`)
    - `--https`: Used HTTPS `true`/`false` (Default: `true`)
    - `--varnish-host`: Varnish host (Empty is not use varnish)
    - `--varnish-port`: Varnish port (Default: `6081`)
#### HTML V-Host
<pre>
create-html-vhost [&lt;option&gt;=&lt;value&gt;...]
</pre>
- Options
    - `--help` `-h`: Help
    - `--folder`: Project folder (Default: `\project`)
    - `--server-name`: Server name (Default: `localhost`)
    - `--https`: Used HTTPS `true`/`false` (Default: `true`)
    - `--varnish-host`: Varnish host (Empty is not use varnish)
    - `--varnish-port`: Varnish port (Default: `6081`)
#### Forward V-Host (NodeJS ...)
<pre>
create-forward-vhost --proxy-host=&lt;value&gt; --proxy-port=&lt;value&gt; [&lt;option&gt;=&lt;value&gt;...]
</pre>
- Options
    - `--help` `-h`: Help
    - `--folder`: Project folder (Default: `\project`)
    - `--server-name`: Server name (Default: `localhost`)
    - `--https`: Used HTTPS `true`/`false` (Default: `true`)


## PHP
- Working on user `www` and `/app` directory
### ENV
- MAILHOG_ADDR: Mailhog address (default: `mailhog:1025`)
- MODULE_ENABLE: List of PHP modules to enable (Eg: `intl mbstring opcache`)
- MODULE_DISABLE: List of PHP modules to disable (Eg: `xdebug opcache`)
- PHP_CONFIG: PHP config (Eg: `date.timezone=UTC memory_limit=512M`)
- FPM_POOL: FPM config (Eg: `pm.max_children=10 pm.start_servers=4 pm.min_spare_servers=2 pm.max_spare_servers=6`)
- XDEBUG_HOST: Custom Xdebug host. Default: IP address of the container. For Windows (WSL) or MacOS, the value should be `host.docker.internal`.
- MAGERUN_VERSION: Magerun N98 version (For Magento).
### FPM Default Config
<pre>
listen = 9000
listen.owner = www
listen.group = www
pm = dynamic
pm.max_children = 10
pm.start_servers = 4
pm.min_spare_servers = 2
pm.max_spare_servers = 6
</pre>
### Start Crontab Service
<pre>cron-start</pre>

### Download magerun n98 command for Magento2
<pre>download-magerun [version]</pre>
- Command after download: <pre>magerun</pre>
- Default download version: MAGERUN_VERSION env.

### Optimize composer 1
- Install composer package `hirak/prestissimo`
<pre>optimize-composer1</pre>

### Fix project file permission
<pre>permission [&lt;project path&gt;]</pre>
- Default: `/app` folder

### Update PHP config
<pre>php-config &lt;key&gt;=&lt;value&gt; [&lt;key&gt;=&lt;value&gt;...]</pre>

### Disable module(s)
<pre>php-disable &lt;module name&gt; [&lt;module name&gt;...]</pre>

### Enable module(s)
<pre>php-enable &lt;module name&gt; [&lt;module name&gt;...]</pre>

### Update FPM config
<pre>php-pool &lt;key&gt;=&lt;value&gt; [&lt;key&gt;=&lt;value&gt;...]</pre>


## NodeJS
- Working on user `www` and `/app` directory

## Varnish
- Working on port `6081`
- Configuration file `/etc/varnish/default.vcl`

## MailHog
- Working port `1025`
- GUI `localhost:8025`