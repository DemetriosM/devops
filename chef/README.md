Chef

MySQL cookbook:(using comunity or by yourself)
- install mysql
- start it and enable it

Apache coobook(using comunity or by yourself)
- install apache package
- start it and enable it
- change in Apache config destination to WordPress endpoint(notify restart if changed)

WordPress cookbook:
- download wordpress
- extract it
- run sql command (by execute if it is your coobook or by custom resource if community)
- create templte for sysv service
- start it and enable it