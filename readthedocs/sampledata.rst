===========
Sample data anf fixtures
===========

There are three two ways for load sample data to DB. The first of them load data from .sql archive. Other use fixtures.


Load data from .sql archive
-------------------------

For create clear db, use:

**dropdb scrm**
**createdb scrm**

For load data to DB:

**psql scrm < clear_db_with_user_permissions.sql** Only users data, permissions and sales manager


.. table::

    ================== ============== ==============
         Login             Role         Password
    ================== ============== ==============
        ama               Superuser     djangoone
        new_admin         Admin         djangoone
        new_manager       Manager       djangoone
        new_boss          Boss          djangoone
    ================== ============== ==============

