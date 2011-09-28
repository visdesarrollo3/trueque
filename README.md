TRUEQUE LITERARIO

http://truequeliterario.com


Log Instalación Trueque Literario:
=======

Instalar RVM
-----

Como **root** se corrió

    bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)

Se deben seguir las instrucciones del instalador. Agregar RVM al path

    # Si se instala como root
    /usr/local/rvm/bin
    
    # Si se instala como usuario
    $HOME/.rvm/bin

Instalar Ruby 1.9.2
-----------

Como **root** se corrió:

    rvm install 1.9.2
    rvm use 1.9.2
    gem install bundler --no-ri --no-rdoc

Instalar el proyecto y las dependencias
-------

En `/var/www/html/` se corrió el comando

    git clone git://github.com/Zinergia/trueque.git

Esto crea la carpea `/var/www/html/trueque`

**NOTA: SI AL ENTRAR A LA CARPETA TRUEQUE, SALE UN MENSAJE DE RVM, DARLE _YES_**

Después, se deben instalar las dependencias:

    cd /var/www/html/trueque
    bundle install --deployment --without development test

Instalación de base de datos
-----

Primero se tiene que configurar la base de datos:

    cd /var/www/html/trueque
    emacs config/database.yml
    
Agregar en este archivo los datos de acceso de la base de datos en el ambiente de producción. Una muestra en el link de abajo:

    # Muestra
    https://gist.github.com/1121313
    
    #Configuración utilizada ese día
    production:
      adapter: mysql2
      encoding: utf8
      database: db-truequeliterario
      pool: 5
      username: usr-trueque
      password: tpLncShfVk8T
      host: localhost

Después, se debe correr el script de migración:

    cd /var/www/html/trueque
    bundle exec rake db:migrate RAILS_ENV=production

Es posible que sea necesario instalar **SQLITE3**, esto se logra con: `yum install sqlite3-devel`


Instalación de passenger
-----

Para poder comunicar Apache con la aplicación, se necesita Passenger:

    cd /var/www/html/trueque
    rvm 1.9.2
    gem install passenger --no-ri --no-rdoc
    
**NO SEGUIR LAS INSTRUCCIONES DEL VIRTUAL HOST DE PASSENGER**

Como se tiene una versión de ruby específica para esta aplicación. Es necesario realizar un **REVERSE PROXY** en el Virtual Host de Apache.

Para esto, se debe tener el siguiente virtual host:

    <VirtualHost *:80>
        ServerName truequeliterario.eafit.edu.co
        DocumentRoot /var/www/html/trueque/public
        PassengerEnabled off
        ProxyPass / http://localhost:3000/
        ProxyPassReverse / http://localhost:3000/

        <Directory /var/www/html/trueque/public>
            AllowOverride all
            Options -MultiViews
            Order allow,deny
            Allow from all
        </Directory>

    </VirtualHost>

Se debe iniciar el servidor passenger **EN LA CARPETA DEL TRUEQUE**
    
    # In the apps root directory run
    # passenger start -a localhost -p 3000 -e production -d
    cd /var/www/html/trueque/
    passenger start -a localhost -p 3000 -e production -d
    

**NOTA: DEBE SALIR UN LETRERO SIMILAR A ESTE**

    =============== Phusion Passenger Standalone web server started ===============
    PID file: /var/www/html/trueque/tmp/pids/passenger.3000.pid
    Log file: /var/www/html/trueque/log/passenger.3000.log
    Environment: production
    Accessible via: http://localhost:3000/

    Serving in the background as a daemon.
    ===============================================================================

**LISTO**
