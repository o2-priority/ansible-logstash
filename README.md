Logstash
========

Ansible role to install and configure Logstash.

This role has been tested with Logstash v2.2 only

*Note:* Logstash requires Java 1.7+

## Examples

```
- hosts: loghost

  vars:
    logstash_version: 2.2
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


## Dependencies:

None
