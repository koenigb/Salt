 {% if grains['os_family'] == 'RedHat' %}

create_user_bkoenig:
  user.present:
    - name: bkoenig
    - fullname: Brandon Koenig
    - shell: /bin/bash
    - home: /home/bkoenig
    - groups:
      - wheel
{% endif %}

