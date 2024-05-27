# Docker Images

## Nginx
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
    - `--folder`: Project folder (Default: `\project`)
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
### Enable module(s)
<pre>php-enable &lt;module name&gt; [&lt;module name&gt;...]</pre>
### Disable module(s)
<pre>php-disable &lt;module name&gt; [&lt;module name&gt;...]</pre>
### Update FPM config
<pre>ppool &lt;key&gt;=&lt;value&gt; [&lt;key&gt;=&lt;value&gt;...]</pre>
### Start Crontab Service
<pre>cron-start</pre>
### Fix project file permission
<pre>permission [&lt;project path&gt;]</pre>
- Default: `/project` folder
### Download n98 command for Magento2
<pre>download-n98</pre>
### Optimize composer 1
- Install composer package `hirak/prestissimo`
<pre>optimize-composer1</pre>
