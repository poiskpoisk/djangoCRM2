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

Public and a1 tenant were present. Login and passwords the same.
Use youdomain.xxx/admin for public DB, a1.youdomain.xxx/admin for a1 tenant


.. table::

    ================== ============== ==============
         Login             Role         Password
    ================== ============== ==============
        admin             Superuser     djangoone
        new_admin         Admin         djangoone
        new_manager       Manager       djangoone
        new_boss          Boss          djangoone
    ================== ============== ==============

