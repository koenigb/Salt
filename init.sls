#salt state to install autosys 

{%- if grains['os_family'] == 'RedHat' %}
{%- set artifactory = 'https://artifactory_link' %}
{%- set autosys_agent_bin = 'Autosys_agent12.0.0.bin' %}
{%- set source_hash = 'source hash from artifactory' %}
{%- set autosys_silent_install = 'autosys_silentinstall.properties' %}


#Sets up the config file which sets up autosys agent 
autosys_agent_install_file:
  file.managed:
    - name: /apps/Autosys/{{ autosys_agent_bin }}
    - source: {{ artifactory }}/{{ autosys_agent_bin }}
    - user: root
    - group: root
    - mode: '0754'
    - makedirs: True
    - source_hash: {{source_hash}}

Creating_autosys_silent_properties:
file.managed:
  - name: /apps/Autosys/{{ autosys_silent_install }}
  - source: salt://ssnc-unix/autosys/files{{ autosys_silent_install }} #path to gitlab to pull the file
  - makedirs: True

install_autosys_agent:
cmd.run:
  - name: /apps/Autosys/{{ autosys_agent_bin }} -f /apps/Autosys/{{ autosys_silent_install }}
  # End of OS check
  {% endif %}