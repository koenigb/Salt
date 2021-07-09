{% from "/srv/salt/users/map.jinja" import users with context %}

create_user_bkoenig:
  user.present:
    - name: bkoenig
    - fullname: Brandon Koenig
    - shell: /bin/bash
    - home: /home/bkoenig
    - groups:
      - {{ users.sudo_group }}
