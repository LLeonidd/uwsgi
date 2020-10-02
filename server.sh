#Запуск/Остановка/Перезагрузка uwsgi с доп. параметрами, под разными пользователями

name="app_name" #Название проекта
cuser=uwsgi #Пользователь под которым запускать воркеры/процессы uwsgi
ROOT="/path/to/project/$name" #Путь до проекта 
pidfile=$ROOT/$name.pid 
config=$name"_uwsgi.ini" # Название конфигурационного ini файла
cd $ROOT
case "$1" in
    "start")
        sudo su - $cuser -c "uwsgi --ini $ROOT/$config" -s /bin/sh       
        ;;
    "stop")
        sudo su - $cuser -c "kill -9 `cat $pidfile`" -s /bin/sh
        ;;
    "restart")
        ./server.sh stop
        ./server.sh start
        ;;
    *) 
        echo "Usage: ./server.sh {start|stop|restart}"
        ;;
esac
