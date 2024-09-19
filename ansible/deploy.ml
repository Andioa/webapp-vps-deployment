---
- hosts: vps
  become: yes

  tasks:
    - name: Install dependencies
      apt:
        name: "{{ item }}"
        state: present
      loop:
        - nginx
        - docker.io
        - docker-compose

    - name: Clone repository
      git:
        repo: 'https://github.com/username/webapp-vps-deployment.git'
        dest: /var/www/webapp

    - name: Copy Nginx config
      copy:
        src: /var/www/webapp/nginx/nginx.conf
        dest: /etc/nginx/sites-available/default
      notify:
        - restart nginx

    - name: Build and start containers
      shell: docker-compose -f /var/www/webapp/docker/docker-compose.yml up -d

  handlers:
    - name: restart nginx
      service:
        name: nginx
        state: restarted
