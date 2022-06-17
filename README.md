# 🐳 inception

### 42 inception subject : Docker-compose로 wordpress 구성하기
This project aims to broaden your knowledge of system administration by using Docker.
You will virtualize several Docker images, creating them in your new personal virtual machine.

2022.04.13 ~ 2022.06.17

- `docker-compose`로 `nginx`, `mariadb`, `wordpress` 세 개의 컨테이너를 구성합니다.
- 모든 컨테이너는 이미지를 직접 빌드해야 합니다.
- `niginx` 컨테이너는 nginx 서버가 동작하고 있어야 하며, 443 포트만 사용합니다. self certification 해서 ssl을 적용합니다.
- `mariadb` 컨테이너는 mriadb가 동작하고 있어야 하며, mysql에 root 유저로 접근할 시, 비밀번호 없이는 접근이 불가능해야 합니다. DB의 데이터는 local volume에 저장되어야 합니다.
- `wordpress` 컨테이너는 php-fpm으로 wordpress가 동작하고 있어야 하며, wordpress의 데이터는 local volume에 저장되어야 합니다.
- host OS를 재부팅 했을 때에도 모든 데이터가 유지되어야 합니다.


> ## Mandatory part
> - A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.
> - A Docker container that contains WordPress + php-fpm (it must be installed and configured) only without nginx.
> - A Docker container that contains MariaDB only without nginx.
> - A volume that contains your WordPress database.
> - A second volume that contains your WordPress website files.
> - A docker-network that establishes the connection between your containers
> - In your WordPress database, there must be two users, one of them being the administrator. The administrator’s username can’t contain admin/Admin or administrator/Administrator (e.g., admin, administrator, Administrator, admin-123, and
so forth).
