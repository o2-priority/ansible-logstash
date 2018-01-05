Logstash
========

Ansible role to install and configure Logstash v5.x & v6.x.


*Note:* Logstash requires Java 1.7+

## Examples

```
- hosts: loghost

  vars:
	logstash_version: '1:6.1.0-1'
    logstash_input_configs:
      - |
        file {
                path => ["/var/log/nginx/access.log"]
            }
    logstash_output_configs:
      - |
        stdout {
                codec => rubydebug
            }
      - |
        elasticsearch {
                hosts => ["localhost:9200"]
            }

  roles:
    - wunzeco.logstash
```

> *Resources that may help with multiline config:*
>    - For multiline config examples:
>        https://www.elastic.co/guide/en/beats/filebeat/master/multiline-examples.html
>    - To test regexp patterns:
>        https://play.golang.org/p/uAd5XHxscu


## Testing

To test this role, run

```
kitchen test
```


## Dependencies:

None
