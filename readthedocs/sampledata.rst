================
Sample data and fixtures
===============

For create clear db, use:

**dropdb scrm**
**createdb scrm**

For load data to DB:

**psql scrm < clear_db_with_user_permissions.sql** Only users data and permissions


.. table::

    ================== ============== ==============
         Login             Role         Password
    ================== ============== ==============
        ama               Superuser     djangoone
        new_admin         Admin         djangoone
        new_manager       Manager       djangoone
        new_boss          Boss          djangoone

    ================== ============== ==============

