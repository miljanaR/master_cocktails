# master_cocktails

## Prerequisites

You will need Leiningen and MySql installed.

## Running

Steps for running this application:

1. Login to the MySQL server and create database db_cocktails with the following command:


You can change database configuration in configuration/db-config.edn:

    {:db "db_cocktails" :user "root" :password ""}

3. To start a web server for the application, run command:

	lein ring server

Finally, login as admin:

    username: admin
    password: admin

Or register your user account.

## About this Project

You can see more on https://drive.google.com/open?id=1S4ZguwEJS0H9W_IFpB99NLjLySblqs2S

## License

Copyright © 2019 FIXME

This program and the accompanying materials are made available under the
terms of the Eclipse Public License 2.0 which is available at
http://www.eclipse.org/legal/epl-2.0.

This Source Code may also be made available under the following Secondary
Licenses when the conditions for such availability set forth in the Eclipse
Public License, v. 2.0 are satisfied: GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or (at your
option) any later version, with the GNU Classpath Exception which is available
at https://www.gnu.org/software/classpath/license.html.
